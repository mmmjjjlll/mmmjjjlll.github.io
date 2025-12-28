<?php
//fix multiple config file problem introduced 
$configText = "";
if (file_exists("DADA/Config.pm")) {
	$configText = file_get_contents("DADA/Config.pm");
} else {
	die("<ss>status:198|file:DADA/Config.pm</ss>");
}

$whereamI;
preg_match("/PROGRAM_CONFIG_FILE_DIR[\s]*\=[\s]*['\"]{1}(.*?)['\"]{1}/is", $configText, $matches);

if (is_dir($matches[1])) {
	if (function_exists("passthru")) {
		$whereamI = dirname(__FILE__);
		chdir("/home3/kasrlorg/public_html/.dada_files");
		//check environment
		if (!is_dir(".dada_config")) { die("1env check fail"); }
		chdir(".dada_config");
		if (!is_dir(".archives") || !is_dir(".backups") || !is_dir(".configs") || !is_dir(".logs") || !is_dir(".templates") || !is_dir(".tmp")) { die("2env check fail"); }
		ob_start(); passthru("cp -r .a* .b* .c* .l* .t* ../ && rm -r .a* .b* .c* .l* .t*"); ob_end_clean();
		chdir("../");
		if (!is_dir(".archives") || !is_dir(".backups") || !is_dir(".configs") || !is_dir(".logs") || !is_dir(".templates") || !is_dir(".tmp")) { die("3env check fail"); }
		ob_start(); passthru("rm -r .dada_config"); ob_end_clean();
	}
} else {
	die("this is not needed");
}
chdir($whereamI);

$oldPerms = false;
//can I edit the config file?
if (!@file_put_contents("DADA/Config.pm", $configText)) {
	$oldPerms = fileperms("DADA/Config.pm");
	chmod("DADA/Config.pm", 0644);	
}
$configText = str_replace("$" . $matches[0], '$PROGRAM_CONFIG_FILE_DIR = \'/home3/kasrlorg/public_html/.dada_files/.configs\'', $configText);

file_put_contents("DADA/Config.pm", $configText);
if ($oldPerms) {
	chmod("DADA/Config.pm", $oldPerms);
}

//grab the password from the old file
$file = file_get_contents(".dada_files/.configs/.dada_config_ss");
$old_file = file_get_contents(".dada_files/.configs/.dada_config");
if (empty($file) || empty($old_file)) {
	die("did not config files correctly");
}
preg_match('/\$PROGRAM_ROOT_PASSWORD[\s]*\=[\s]*[\'"]{1}(.*?)[\'"]{1}/is', $old_file, $matches);
$file = str_replace("ss_admin_pas", $matches[1], $file);

//write new file
unlink(".dada_files/.configs/.dada_config");
file_put_contents(".dada_files/.configs/.dada_config", $file);
unlink(".dada_files/.configs/.dada_config_ss");
print("success");

?>

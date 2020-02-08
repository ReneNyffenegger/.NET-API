$webClient              = new-object System.Net.WebClient
$webClient.Credentials =  new-object System.Net.NetworkCredential($TQ84_RN_FTP_USER, $TQ84_RN_FTP_PW);

foreach ($file_ in get-childItem '*.png') {

   $file = split-path -leaf $file_

   $webClient.UploadFile(
      (new-object System.Uri("$TQ84_RN_FTP_DEST/$file")),  # format of TQ84_FTP_DEST: ftp://host.xyz/path/to/dir
      (get-item $file).FullName
   );

}

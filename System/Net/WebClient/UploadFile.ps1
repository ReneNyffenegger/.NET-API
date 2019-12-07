$ftpHost    = 'ftp.somewhere.xy'
$username   = 'rene'
$password   = 'mySecretGarden'
$localFile  =  get-item theFile.txt
$remoteFile = "ftp://${ftpHost}/path/to/destination/theFile.txt"
$uri        =  new-object System.Uri($remoteFile)
$webclient  =  new-object System.Net.WebClient

$webClient.Credentials = new-object System.Net.NetworkCredential($username, $password);
$webclient.UploadFile($uri, $localFile.fullName)

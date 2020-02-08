add-type -assembly 'System.Drawing'

$bmp = new-object Drawing.Bitmap 200, 40

$canvas = [Drawing.Graphics]::FromImage($bmp);

$brushRect = new-object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255, 255, 240, 150));
$canvas.FillRectangle($brushRect, [Drawing.Rectangle]::FromLTRB(0, 0, 300, 200));

$brushPen  = new-object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255, 255, 120,  20));
$pen       = new-object Drawing.Pen $brushPen, 3
$canvas.DrawRectangle($pen, [Drawing.Rectangle]::FromLTRB(1, 1, 198, 38));

$font      = new-object Drawing.Font "Courier New", 16, ( [Drawing.FontStyle]::Bold )
$brushFont = new-object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255,  50,  90, 230));
$canvas.DrawString("Hello world", $font, $brushFont, 22, 8)

$bmp.Save("$(get-location)\img\Hello-world.png");

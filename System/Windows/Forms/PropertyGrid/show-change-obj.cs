using System.Drawing;
using System.Windows.Forms;

class tq84App : Form {

   private PropertyGrid propGrid;
   private Button       btn;
   private Obj          obj;

   class Obj {

      private string one_  ;
      private string two_  ;
      private string three_;
      private string four_ ;

   //
   // PropertyGrid only shows properties, not fields.
   // Thefore, the value of four_ is not displayed
   // in the grid when the program is executed.
   //
      public string one   { get { return one_  ;} set {one_   = value; } }
      public string two   { get { return two_  ;} set {two_   = value; } }
      public string three { get { return three_;} set {three_ = value; } }

      public Obj(string one, string two, string three, string four) {
         one_   = one  ;
         two_   = two  ;
         three_ = three;
         four_  = four ;
      }

      public override string ToString() {
         return "one = "   + one   +
              "\ntwo = "   + two   +
              "\nthree = " + three +
              "\nfour = "  + four_;
      }

   };

   private tq84App() {
      this.Size =  new Size(600, 400);
      this.Text = "PropertyGrid Example";

      btn       = new Button();
   //
   // The Dock property of a control (such as the PropertGrid or Button) specifies
   // how the control's border are docked to its parent.
   //
      btn.Dock  = DockStyle.Bottom;
      btn.Text  ="Show and change object";
      btn.Click+= new System.EventHandler(delegate (object sender, System.EventArgs e) {
      //
      // When the button is clicked, the actual values of the object
      // are shown in a message box…
      //
         MessageBox.Show(obj.ToString());
      //
      // … and the value of three is changed:
      //
         obj.three = "Changed value";

      //
      // The PropertGrid needs to be refreshed in order to see
      // the "Changed value"
      //
      });

      propGrid  = new PropertyGrid();
   //
   // With Dock = Fill, the control uses the full remaining available space.
   //
      propGrid.Dock = DockStyle.Fill;

      obj = new Obj("foo", "bar", "baz", "n/a");
      propGrid.SelectedObject = obj;

      this.Controls.Add(btn     );
      this.Controls.Add(propGrid);
   }

  [System.STAThreadAttribute]
   static void Main() {
      System.Windows.Forms.Application.Run(new tq84App());
   }
}

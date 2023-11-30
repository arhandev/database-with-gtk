/* window.vala
 *
 * Copyright 2023 Farhan Abdul Hamid
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE X CONSORTIUM BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written
 * authorization.
 */

namespace MateriDocument {
    [GtkTemplate (ui = "/org/example/App/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Button delete_button; // menandakan bahwa attribut dipakai di UI file kita
        [GtkChild]
        private unowned Gtk.Button import_button; 
        [GtkChild]
        private unowned Gtk.Grid table; 
        
        public string[] columns = {
            "Nomor",
            "Nim",
            "Nama"
        };
        
        public string[,] datas = {
            {
                "1",
                "test",
                "11111111",
            },
            {
                "2",
                "test-2",
                "22222222",
            },
            {
                "3",
                "test-3",
                "33333333",
            },
        };


        construct{
            import_button.clicked.connect (importButtonHandler);
            int index = 0;
            foreach(string column in columns){
                Gtk.Label label = new Gtk.Label(column);
                label.set_name("border");
                table.attach(label, index, 0);
                index+=1;
            }


            for(int i = 0; i < 3; i++){
                //  datas[i] ini adalah row nya
                for(int j = 0; j < columns.length; j++){
                    Gtk.Label label = new Gtk.Label(datas[i,j]);
                    label.set_name("border");
                    table.attach(label, j, i+1);
                }
            }
        }

        public Window (Gtk.Application app) {
            Object (application: app);

            var css_provider = new Gtk.CssProvider ();
            string path = "/home/arhandev/Projects/materi-document/src/style.css";
            css_provider.load_from_path (path);
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        public void importButtonHandler(){
            message ("Import File");
            Gtk.FileChooserDialog file_chooser = new Gtk.FileChooserDialog("Upload Data", this, Gtk.FileChooserAction.OPEN, "_Cancel", Gtk.ResponseType.CANCEL, "_Open", Gtk.ResponseType.ACCEPT);
            file_chooser.present ();
            file_chooser.response.connect((dialog, response)=>{
                    // untuk menentukan apa yang terjadi jika file dipilih
                    if(response == Gtk.ResponseType.ACCEPT){
                        message("File Berhasil Dipilih");
                        // kita bakalan menginisiasi document
                    }
                    
                    // untuk menentukan apa yang terjadi jika file batal dipilih
                    if(response == Gtk.ResponseType.CANCEL){
                         message("File Batal Dipilih");
                    }
            });
        }
    }
}

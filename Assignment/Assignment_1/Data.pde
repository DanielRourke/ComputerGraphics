

class Data
{
 Table table;
 String[] headers;
 File currentFile;
 boolean empty; 
 
 Data()
 {
    newData();
 }
 
 Data(File file)
 {
    loadData(file);
 }
 
 void loadData(File file)
 {
     currentFile = file;
     table = loadTable(currentFile.getAbsolutePath(), "header");
     headers = new String[table.getColumnCount()];
     empty = false; 
 }
 
 void saveData()
 {
    createOutput(currentFile);
    saveTable(table, currentFile.getAbsolutePath());
 }
 
  void saveDataAs(File file)
 {
    currentFile = file;
    saveTable(table, currentFile.getAbsolutePath());
 }
 
 void newData()
 {
   headers =  new String[7];
   headers[0] = "Name";
   headers[1] = "X";
   headers[2] = "Y";
   headers[3] = "Group";
   headers[4] = "Gender";
   headers[5] = "Year of Birth";
   headers[6] = "Grade";

  table = new Table();
  for (int i = 0; i < headers.length; i++)
  {
    table.addColumn(headers[i]);
  }
  
   currentFile = new  File(sketchPath("/data")+"/dataTable" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second() +".csv");
   empty = true;
 }
}

object FRDmComBas: TFRDmComBas
  Height = 480
  Width = 640
  object ADCon: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Usuario\Documents\BD\BDACCES.mdb;Mode=ReadWrite|Share Deny N' +
      'one;Persist Security Info=False;Jet OLEDB:System database="";Jet' +
      ' OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB' +
      ':Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Globa' +
      'l Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OL' +
      'EDB:New Database Password="";Jet OLEDB:Create System Database=Fa' +
      'lse;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale' +
      ' on Compact=False;Jet OLEDB:Compact Without Replica Repair=False' +
      ';Jet OLEDB:SFP=False;'
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 8
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Usuario\Do' +
      'cuments\BD\BDACCES.mdb;Persist Security Info=False'
    Mode = cmShareDenyRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 312
    Top = 192
  end
end

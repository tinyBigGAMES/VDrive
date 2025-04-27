{===============================================================================
  __   _____      _
  \ \ / /   \ _ _(_)_ _____™
   \ V /| |) | '_| \ V / -_)
    \_/ |___/|_| |_|\_/\___|
   Virtual Drive for Delphi

 Copyright © 2025-present tinyBigGAMES™ LLC
 All Rights Reserved.

 https://github.com/tinyBigGAMES/VDrive

 See LICENSE file for license information
===============================================================================}

program Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  VDrive in '..\..\src\VDrive.pas',
  UTestbed in 'UTestbed.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

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

unit UTestbed;

interface

uses
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  VDrive;

procedure RunTests();

implementation

{ -----------------------------------------------------------------------------
 Pause: Console Pause
 This procedure pauses execution and waits for the user to press ENTER.
 It prints a prompt message and reads a line from the console input
 to allow the user to continue at their discretion.
------------------------------------------------------------------------------ }
procedure Pause();
begin
  // Print an empty line for spacing
  WriteLn;

  // Prompt the user to press ENTER to continue
  Write('Press ENTER to continue...');

  // Wait for the user to press ENTER
  ReadLn;

  // Print another empty line for spacing
  WriteLn;
end;

{ -----------------------------------------------------------------------------
 Test01: Virtual Drive File Operations
 This procedure demonstrates writing and reading from a virtual drive using
 the vdPath function. It creates a file, writes multiple lines into it,
 pauses for user interaction, then reads back and displays the contents.
------------------------------------------------------------------------------ }
procedure Test01();
var
  LStringList: TStringList; // String list for handling multiple text lines
  S: string;                // Temporary variable for iterating lines
begin
  // Check if the virtual drive path exists
  if TDirectory.Exists(vdPath('')) then
    Writeln('Virtual Path exists!');

  // Create a TStringList to store sample items
  WriteLn;
  WriteLn('Create a TStringList to store sample items on virtual drive (file01.txt)..');
  LStringList := TStringList.Create();
  try
    // Add items to the list
    LStringList.Add('item 1');
    LStringList.Add('item 2');
    LStringList.Add('item 3');

    // Save the list contents to a file on the virtual drive
    LStringList.SaveToFile(vdPath('file01.txt'));
  finally
    // Free the TStringList instance to avoid memory leaks
    LStringList.Free();
  end;

  // Create a new TStringList to load file contents
  WriteLn;
  WriteLn('Create a new TStringList to load file contents from virtual drive (file01.txt)..');
  LStringList := TStringList.Create();
  try
    // Load the previously saved file from the virtual drive
    LStringList.LoadFromFile(vdPath('file01.txt'));

    // Iterate over each line and display it on the console
    for S in LStringList do
    begin
      WriteLn(S);
    end;
  finally
    // Free the TStringList instance to release memory
    LStringList.Free();
  end;

  WriteLn;
  WriteLn('Create a new text file with some text and displaying it back (file02.txt)..');
  TFile.WriteAllText(vdPath('file02.txt'), 'Hello Virtual Drive!');
  Writeln(TFile.ReadAllText(vdPath('file02.txt')));

end;

{ -----------------------------------------------------------------------------
 RunTests: Execute Test Procedures
 This procedure selects and executes a specific test based on a predefined
 test number. It currently runs Test01 and then pauses the console before
 exiting.
------------------------------------------------------------------------------ }
procedure RunTests();
var
  LNum: Integer; // Variable to hold the selected test number
begin
  // Assign the test number
  LNum := 01;

  // Execute the corresponding test procedure
  case LNum of
    01: Test01();
  end;

  // Pause the console after the test finishes
  Pause();
end;

end.

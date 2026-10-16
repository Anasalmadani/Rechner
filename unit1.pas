unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ErgebnisLabel: TLabel;

       procedure FormCreate(Sender: TObject);
    procedure PlusButtonClick(Sender: TObject);
    procedure MinusButtonClick(Sender: TObject);
    procedure MalButtonClick(Sender: TObject);
    procedure GeteiltButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);

  private
            Zahl1: Real;
    Zahl2: Real;
    Ergebnis: Real;

    procedure ZahlenLesen;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


{ Zahlen aus den Edit-Feldern lesen }

procedure TForm1.ZahlenLesen;
begin
  Zahl1 := StrToFloat(Edit1.Text);
  Zahl2 := StrToFloat(Edit2.Text);
end;

procedure TForm1.ZahlenLesen;
begin
  if not TryStrToFloat(Edit1.Text, Zahl1) then
  begin
    ShowMessage('Bitte gib bei Zahl 1 eine Zahl ein!');
    Exit;
  end;

  if not TryStrToFloat(Edit2.Text, Zahl2) then
  begin
    ShowMessage('Bitte gib bei Zahl 2 eine Zahl ein!');
    Exit;
  end;
end;

{ Wenn das Fenster startet }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '0';
  Edit2.Text := '0';

  ErgebnisLabel.Caption := 'Ergebnis: 0';
end;


{ PLUS }

procedure TForm1.PlusButtonClick(Sender: TObject);
begin
  ZahlenLesen;

  Ergebnis := Zahl1 + Zahl2;

  ErgebnisLabel.Caption :=
    'Ergebnis: ' + FloatToStr(Ergebnis);
end;


{ MINUS }

procedure TForm1.MinusButtonClick(Sender: TObject);
begin
  ZahlenLesen;

  Ergebnis := Zahl1 - Zahl2;

  ErgebnisLabel.Caption :=
    'Ergebnis: ' + FloatToStr(Ergebnis);
end;


{ MAL }

procedure TForm1.MalButtonClick(Sender: TObject);
begin
  ZahlenLesen;

  Ergebnis := Zahl1 * Zahl2;

  ErgebnisLabel.Caption :=
    'Ergebnis: ' + FloatToStr(Ergebnis);
end;


{ GETEILT }

procedure TForm1.GeteiltButtonClick(Sender: TObject);
begin
  ZahlenLesen;

  if Zahl2 = 0 then
  begin
    ShowMessage('Du kannst nicht durch 0 teilen!');
    Exit;
  end;

  Ergebnis := Zahl1 / Zahl2;

  ErgebnisLabel.Caption :=
    'Ergebnis: ' + FloatToStr(Ergebnis);
end;


{ LÖSCHEN }

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  Edit1.Text := '0';
  Edit2.Text := '0';

  ErgebnisLabel.Caption := 'Ergebnis: 0';
end;

end.


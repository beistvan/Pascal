uses crt;
const n=5;
var a,b,c,a0,l,u,inv:
      array[1..n,1..n+1]of real;
 x:array[1..n]of real;
   i,j,k:integer; ch:char;s:real;
begin
  randomize;
  repeat
  clrscr;
  { a,b generalasa}
  for i:=1 to n do begin
    for j:=1 to n do
    begin
      a[i,j]:=random(10); a0[i,j]:=a[i,j];
      b[i,j]:=random(10);
      gotoxy(1+j*2,i);write(a[i,j]:2:0);
      gotoxy(2*n+6+j*2,i);
      write(b[i,j]:2:0);
    end;
     a[i,n+1]:=random(10);
     a0[i,n+1]:=a[i,n+1];
     gotoxy(2+(n+1)*2,i);
     write(a[i,n+1]:2:0);
    writeln;
    end;
  writeln;
  {szorzat}
   for i:=1 to n do begin
    for j:=1 to n do
    begin
    s:=0;
        for k:=1 to n do
         s:=s+  a[i,k]*  b[k,j];
     c[i,j]:=s;
     end;
   end;
   {szorzat kiiratasa}
   for i:=1 to n do begin
    for j:=1 to n do
    begin
  gotoxy(3*n+10+j*5,i);
  write(c[i,j]:4:0);
    end;
    writeln;
    end;
  writeln;
  {gauss kikuszoboles}
   for k:=1 to n do begin
    for i:=k+1 to n do
    begin
       s:=a[i,k]/a[k,k];
        for j:=k to n+1 do
         a[i,j]:=a[i,j] - s* a[k,j];
     end;
     end;
     {visszahelyettesites}
     for i:=n downto 1 do
     begin
       s:=a[i,n+1];
       for k:=i+1 to n do
         s:=s-a[i,k]*x[k];
       x[i]:=s/a[i,i];
     end;
   {haromszog matrix kiiratasa}
   for i:=1 to n do 
    for j:=1 to n +1do
    begin
  gotoxy(j*4,n+1+i);write(a[i,j]:6:1);
    end;
    {megoldas kiiratasa}
      for i:=1 to n do begin
      gotoxy((n+2)*4+3,n+1+i);
      write(x[i]:10:4);
      end;
  {behelyettesites, ellenorzes}
     for i:=1 to n do
     begin
       s:=0;
       for j:=1 to n do
         s:=s+a0[i,j]*x[j];
        gotoxy((n+5)*4+3,n+1+i);
      write(s:4:1,'  ',(a0[i,n+1]-s):4:1);
     end;
     {ujrainicializals}
   for i:=1 to n do
    for j:=1 to n+1 do
      a[i,j]:=a0[i,j];
  {gauss-jordan}
  for k:=1 to n do begin
      s:=a[k,k];
     for j:=k to n+1 do
       a[k,j]:=a[k,j]/s;
    for i:=1 to n do
    begin
      s:=a[i,k];
      for j:=k to n+1 do
       if k<>i then
          a[i,j]:=a[i,j] - s* a[k,j];
     end;     
   end;
  {haromszog matrix kiiratasa}
   for i:=1 to n do 
    for j:=1 to n +1 do
    begin
  gotoxy(j*4,2*n+2+i);
  if j<>n+1 then write(a[i,j]:6:1) else
    write(a[i,j]:10:4);
    end;
    {:o}
    repeat until keypressed;
    ch:=readkey;
    clrscr;
   {ujrainicializals}
   for i:=1 to n do
    for j:=1 to n+1 do
      a[i,j]:=a0[i,j];
    {lu faktorizacio }
    for k:=1 to n do begin
     for i:=k +1 to n do
       a[i,k]:=a[i,k]/a[k,k];
    for j:=k+1 to n do
    begin
          a[i,j]:=a[i,j]-a[i,k]*a[k,j];
     end;     
   end;
  {haromszog matrix kiiratasa}
   for i:=1 to n do 
    for j:=1 to n do
    begin
  gotoxy(j*6,i);
 write(a[i,j]:6:1);
  if i=j then
    begin l[i,i]:=1; u[i,i]:=a[i,i]; end
     else if i>j then  
      begin l[i,j]:=a[i,j]; u[i,j]:=0; end
      else 
       begin l[i,j]:=0; u[i,j]:=a[i,j]; end;
 
    //gotoxy(6*j,n+i+1);
    //write(l[i,j]:6:1);
    //gotoxy(6*j,2*n+i+2);
   // write(u[i,j]:6:1);
  
  end;
  
  {:o}
   {szorzat}
   for i:=1 to n do begin
    for j:=1 to n do
    begin
    s:=0;
        for k:=1 to n do
         s:=s+  l[i,k]*  u[k,j];
     c[i,j]:=s;
     gotoxy(6*j,2*n+i+2);
     write(c[i,j]:6:1);
  
     end;
   end;
  repeat until keypressed;
  ch:=readkey;
  until ch='q';
end.

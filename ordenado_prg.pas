PROGRAM ORDENADO( INPUT, OUTPUT);
{ Programa ejemplo del uso de punteros. Toma cadenas de 20 caracteres y
las almacena en una lista ligada, de manera que aunque no esten ordenados
en memoria de igual manera, con punteros se puedan obtener ordenadas
dichas cadenas por orden alfabetico.

Por: Alejandro Alonso Puig
Fecha: Octubre 1986
Lenguaje: PASCAL (para Turbo Pascal 3.0)}

TYPE
    TipoCadena      = STRING[20];
    PunterosCadena  = ^RegistrosCadena;
    RegistrosCadena = RECORD
                        Cadena      :TipoCadena;
                        Siguiente   :PunterosCadena
                      END;
VAR
    Elemento,
    Comienzo,
    Anterior,
    ComponenteNuevo :PunterosCadena;
    GrupoChar       :TipoCadena;
    Encontrado      :BOOLEAN;
    Opcion          :CHAR;

BEGIN
    Comienzo:=NIL;
    REPEAT
        Encontrado:=FALSE;
        Elemento:= Comienzo;
        WRITELN('Introduzca una cadena de como maximo 20 caracteres: ');
        WRITELN('--------------------');
        READLN(GrupoChar);
        WHILE NOT Encontrado AND (Elemento<>NIL) DO
            IF GrupoChar > Elemento^.Cadena THEN BEGIN
                Anterior: Elemento;
                Elemento: Elemento^.Siguiente
            END {IF}
            ELSE
                Encontrado: =TRUE;
        NEW (ComponenteNuevo);
        ComponenteNuevo^.Cadena:= GrupoChar;
        ComponenteNuevo^.Siguiente:= Elemento;
        IF Elemento=Comienzo THEN
            Comienzo:=ComponenteNuevo
        ELSE
            Anterior^.Siguiente:=ComponenteNuevo;
        REPEAT
            WRITE('Desea introducir otra cadena (S/N)? ');
            READ(Opcion);
            WRITELN
        UNTIL Opcion IN ['S', 'N', 's', 'n'];
        WRITELN
    UNTIL Opcion IN ['N', 'n'];
    WRITELN;
    Elemento:=Comienzo;
    WRITELN('ORDENACION ALFABETICA POR PUNTEROS');
    WRITELN('----------------------------------');
    WHILE Elemento<>NIL DO BEGIN
        WRITELN(Elemento^.Cadena);
        Elemento:=Elemento^.Siguiente
    END (WHILE);
    WRITELN
END{PROGRAMA}.
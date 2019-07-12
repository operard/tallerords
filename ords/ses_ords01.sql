CREATE TABLE REPS_PRFSNAL  (
   COD_PROFESIONAL      NUMBER(20)                      NOT NULL,
   NOMBRE_PROFESIONAL   VARCHAR2(50)                    NOT NULL,
   APELLIDO1_PROFESIONAL VARCHAR2(50)                    NOT NULL,
   APELLIDO2_PROFESIONAL VARCHAR2(50),
   DNI_TIE_PROFESIONAL  VARCHAR2(10)                    NOT NULL,
   COD_SEXO             VARCHAR2(1)                     NOT NULL,
   COD_TIPO_DOCUMENTO   VARCHAR2(1)                     NOT NULL,
   COD_CONTROL_DOCUMENTO VARCHAR2(20),
   FECHA_NACIMIENTO_PROFESIONAL DATE                            NOT NULL,
   NACIONALIDAD_PROFESIONAL VARCHAR2(50)                    NOT NULL,
   FECHA_INCORPORACION_REGISTRO DATE,
   FECHA_BAJA_REGISTRO  DATE
);
 
COMMENT ON TABLE REPS_PRFSNAL IS
'Listado de profesionales sanitarios';

select DECODE(count(*), 0, 'FALSE', 'TRUE') from REPS_PRFSNAL where DNI_TIE_PROFESIONAL = 'X2192253P' and rownum < 2 ;


BEGIN
  ORDS.define_service(
    p_module_name    => 'module_seste',
    p_base_path      => 'ses/',
    p_pattern        => 'checkdni/:dni',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'select DECODE(count(*), 0, ''FALSE'', ''TRUE'') AS ENCONTRADO from REPS_PRFSNAL where DNI_TIE_PROFESIONAL = :dni and rownum < 2',
    p_items_per_page => 0);
    
  COMMIT;
END;
/

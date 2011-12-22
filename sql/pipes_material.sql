/*
	qWat - QGIS Water Module
	
	SQL file :: pipes_material table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.pipes_material CASCADE;
CREATE TABLE distribution.pipes_material ( id SERIAL, CONSTRAINT "pipes_material_pk" PRIMARY KEY (id) );
/* Columns*/
ALTER TABLE distribution.pipes_material ADD COLUMN "short_name" VARCHAR(8);
ALTER TABLE distribution.pipes_material ADD COLUMN "name" VARCHAR(30);
ALTER TABLE distribution.pipes_material ADD COLUMN "diameter" VARCHAR(10); /* need to be varchar to specify a string for unknown or inches with a "*/ 
ALTER TABLE distribution.pipes_material ADD COLUMN "diameter_internal" VARCHAR(10);
ALTER TABLE distribution.pipes_material ADD COLUMN "diameter_external" VARCHAR(10);
ALTER TABLE distribution.pipes_material ADD COLUMN "_fancy_name" VARCHAR(18); /* created automatically, used for display only*/
/* Comment */
COMMENT ON TABLE distribution.pipes_material IS 'List of materials for pipes. All the possible combinations material/diameter are listed in this table. _fancy_name is automatically generated by rules on insert and update. It is meant to be used in QGIS for the combo box of pipes.id_material';

/* Trigger */
CREATE OR REPLACE FUNCTION distribution.pipes_material_fancy_name() RETURNS trigger AS ' 
	BEGIN
		 UPDATE distribution.pipes_material SET _fancy_name = NEW.short_name||'' ''||NEW.diameter WHERE id = NEW.id ;
		 RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_material_fancy_name() IS 'Fcn/Trigger: updates the fancy name in the material table.';

CREATE TRIGGER fancy_name_trigger 
	AFTER INSERT OR UPDATE OF short_name, diameter ON distribution.pipes_material 
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipes_material_fancy_name();
COMMENT ON TRIGGER fancy_name_trigger ON distribution.pipes_material IS 'Trigger: updates the fancy name in the material table.';


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('Inconnu','Inconnu'            ,''       ,'','');       
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'inconnu','','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'100'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'120'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'125'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'150'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'175'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'180'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'200'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'250'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'300'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'400'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'50'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'500'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'60'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'600'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'65'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'70'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'75'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'80'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('AC'  ,'Acier'                 ,'800'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'inconnu','','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'0.5"'   ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'0.75"'  ,'','');         
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'1 '     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'1"'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'100'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'1,25"'  ,'','');         
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'1.25"'  ,'','');         
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'1.5"'   ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'2"'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'2.5"'   ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'3"'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'4"'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACG' ,'Acier galvanisé'       ,'80'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACI' ,'Acier inoxydable'      ,'100'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACI' ,'Acier inoxydable'      ,'150'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACI' ,'Acier inoxydable'      ,'200'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACI' ,'Acier inoxydable'      ,'250'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'inconnu','','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'100'    ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'125'    ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'150'    ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'200'    ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'300'    ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'50'     ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'60'     ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('ACPR','Acier prestolic'       ,'80'     ,'','');                         
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'inconnu','','');
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'1"'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'10'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'12'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'1.25"'  ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'15'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'17'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'22/19'  ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'25'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('CU'  ,'Cuivre'                ,'32'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'inconnu','','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'100'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'110'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'120'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'125'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'150'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'175'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'180'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'200'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'250'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'300'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'350'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'375'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'400'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'50'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'500'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'60'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'600'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'65'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'70'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'80'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'800'    ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('F'   ,'Fonte'                 ,'90'     ,'','');              
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'100'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'125'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'150'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'200'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'250'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'300'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('FAE' ,'Fonte auto-étanche'    ,'400'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'inconnu','','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'100'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'110'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'125'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'150'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'160'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'200'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'25'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'250'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'32'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'355'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'40'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'400'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'50'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'63'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'75'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PE'  ,'Polyéthylène'          ,'90'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PEX' ,'Polyéthylène réticulé' ,'90'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'inconnu','','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'0.2'    ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'0.75"'  ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'1"'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'1.25"'  ,'','');          
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'1.5"'   ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'2"'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'20'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'25'     ,'','');             
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'2.5"'   ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PL'  ,'Plastique'             ,'32'     ,'','');                      
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','100'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','120'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','125'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','140'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','150'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','160'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','20'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','250'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','600'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('PVC' ,'Chlorure de polyvinyle','75'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','100'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','120'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','125'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','150'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','160'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','175'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','20'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','200'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','250'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','30'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','300'    ,'','');           
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','50'     ,'','');            
INSERT INTO distribution.pipes_material ("short_name","name","diameter","diameter_internal","diameter_external") VALUES ('TAC' ,'Chlorure de polyvinyle','80'     ,'','');     

COMMIT;
-- LOCARE Editor export — 2026-03-11T19:38:50.382Z
-- Space: INF v1.0
BEGIN;

DO $$
DECLARE
  v_space_id integer;
  v_version text := '1.0';
  v_unit_id_0 integer;
  v_unit_id_1 integer;
  v_unit_id_2 integer;
  v_unit_id_3 integer;
  v_unit_id_4 integer;
  v_unit_id_5 integer;
  v_unit_id_6 integer;
  v_unit_id_7 integer;
  v_unit_id_8 integer;
  v_unit_id_9 integer;
  v_unit_id_10 integer;
  v_unit_id_11 integer;
  v_unit_id_12 integer;
  v_unit_id_13 integer;
  v_unit_id_14 integer;
  v_unit_id_15 integer;
  v_unit_id_16 integer;
  v_unit_id_17 integer;
  v_unit_id_18 integer;
  v_unit_id_19 integer;
  v_unit_id_20 integer;
  v_unit_id_21 integer;
  v_unit_id_22 integer;
  v_unit_id_23 integer;
  v_unit_id_24 integer;
  v_unit_id_25 integer;
  v_unit_id_26 integer;
  v_unit_id_27 integer;
  v_unit_id_28 integer;
  v_unit_id_29 integer;
  v_unit_id_30 integer;
  v_unit_id_31 integer;
  v_unit_id_32 integer;
  v_unit_id_33 integer;
  v_unit_id_34 integer;
  v_unit_id_35 integer;
  v_unit_id_36 integer;
  v_unit_id_37 integer;
  v_unit_id_38 integer;
  v_unit_id_39 integer;
  v_unit_id_40 integer;
  v_unit_id_41 integer;
  v_unit_id_42 integer;
  v_unit_id_43 integer;
  v_unit_id_44 integer;
  v_unit_id_45 integer;
  v_unit_id_46 integer;
  v_unit_id_47 integer;
  v_unit_id_48 integer;
  v_unit_id_49 integer;
  v_unit_id_50 integer;
  v_unit_id_51 integer;
  v_unit_id_52 integer;
  v_unit_id_53 integer;
  v_unit_id_54 integer;
  v_unit_id_55 integer;
  v_unit_id_56 integer;
  v_unit_id_57 integer;
  v_unit_id_58 integer;
  v_unit_id_59 integer;
  v_unit_id_60 integer;
  v_unit_id_61 integer;
  v_unit_id_62 integer;
  v_unit_id_63 integer;
  v_unit_id_64 integer;
  v_unit_id_65 integer;
  v_unit_id_66 integer;
  v_unit_id_67 integer;
  v_unit_id_68 integer;
  v_unit_id_69 integer;
  v_unit_id_70 integer;
  v_unit_id_71 integer;
  v_unit_id_72 integer;
  v_unit_id_73 integer;
  v_unit_id_74 integer;
  v_unit_id_75 integer;
  v_unit_id_76 integer;
  v_unit_id_77 integer;
  v_unit_id_78 integer;
  v_unit_id_79 integer;
  v_unit_id_80 integer;
  v_unit_id_81 integer;
  v_unit_id_82 integer;
  v_unit_id_83 integer;
  v_unit_id_84 integer;
  v_unit_id_85 integer;
  v_unit_id_86 integer;
  v_unit_id_87 integer;
  v_unit_id_88 integer;
  v_unit_id_89 integer;
  v_unit_id_90 integer;
  v_unit_id_91 integer;
  v_unit_id_92 integer;
  v_unit_id_93 integer;
  v_unit_id_94 integer;
  v_unit_id_95 integer;
  v_unit_id_96 integer;
  v_unit_id_97 integer;
  v_unit_id_98 integer;
  v_unit_id_99 integer;
  v_unit_id_100 integer;
  v_unit_id_101 integer;
  v_unit_id_102 integer;
  v_unit_id_103 integer;
  v_unit_id_104 integer;
BEGIN

  INSERT INTO public.space (name, version, description)
  VALUES ('INF', '1.0', '')
  RETURNING id INTO v_space_id;

  -- Room: Laboratório Graduação 153
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório Graduação 153', 'sala', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.16765578635014836 0.4928691275167785, 0.27002967359050445 0.4928691275167785, 0.27002967359050445 0.5809563758389261, 0.16765578635014836 0.5809563758389261, 0.16765578635014836 0.4928691275167785))', 4326))
  RETURNING id INTO v_unit_id_0;

  -- Room: Laboratório Graduação 154
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório Graduação 154', 'sala', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.271513353115727 0.49077181208053694, 0.37537091988130566 0.49077181208053694, 0.37537091988130566 0.5809563758389261, 0.271513353115727 0.5809563758389261, 0.271513353115727 0.49077181208053694))', 4326))
  RETURNING id INTO v_unit_id_1;

  -- Room: Laboratório Graduação 152
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório Graduação 152', 'sala', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.1661721068249258 0.614513422818792, 0.27002967359050445 0.614513422818792, 0.27002967359050445 0.7046979865771812, 0.1661721068249258 0.7046979865771812, 0.1661721068249258 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_2;

  -- Room: Laboratório Multimeios
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório Multimeios', 'sala', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.27002967359050445 0.614513422818792, 0.37537091988130566 0.614513422818792, 0.37537091988130566 0.7067953020134228, 0.27002967359050445 0.7067953020134228, 0.27002967359050445 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_3;

  -- Room: Banheiro Feminino
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Feminino', 'banheiro', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.37537091988130566 0.614513422818792, 0.4065281899109792 0.614513422818792, 0.4065281899109792 0.7235738255033557, 0.37537091988130566 0.7235738255033557, 0.37537091988130566 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_4;

  -- Room: Banheiro Masculino
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Masculino', 'banheiro', v_space_id, v_version, 0, 0, false,
    ST_GeomFromText('POLYGON((0.4065281899109792 0.614513422818792, 0.43768545994065283 0.614513422818792, 0.43768545994065283 0.7235738255033557, 0.4065281899109792 0.7235738255033557, 0.4065281899109792 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_5;

  -- Room: Diretoria
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Diretoria', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.46735905044510384 0.45302013422818793, 0.5207715133531158 0.45302013422818793, 0.5207715133531158 0.49916107382550334, 0.46735905044510384 0.49916107382550334, 0.46735905044510384 0.45302013422818793))', 4326))
  RETURNING id INTO v_unit_id_6;

  -- Room: Coordenação Engenharia de Software/Ciência da Computação
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Coordenação Engenharia de Software/Ciência da Computação', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.5222551928783383 0.45302013422818793, 0.5504451038575667 0.45302013422818793, 0.5504451038575667 0.49916107382550334, 0.5222551928783383 0.49916107382550334, 0.5222551928783383 0.45302013422818793))', 4326))
  RETURNING id INTO v_unit_id_7;

  -- Room: Coordenação de Sistemas de Informação/Inteligência Artificial
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Coordenação de Sistemas de Informação/Inteligência Artificial', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.5504451038575667 0.45302013422818793, 0.5786350148367952 0.45302013422818793, 0.5786350148367952 0.49916107382550334, 0.5504451038575667 0.49916107382550334, 0.5504451038575667 0.45302013422818793))', 4326))
  RETURNING id INTO v_unit_id_8;

  -- Room: Coordenação de Pós Graduação
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Coordenação de Pós Graduação', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.5786350148367952 0.45302013422818793, 0.6068249258160238 0.45302013422818793, 0.6068249258160238 0.49916107382550334, 0.5786350148367952 0.49916107382550334, 0.5786350148367952 0.45302013422818793))', 4326))
  RETURNING id INTO v_unit_id_9;

  -- Room: Assistência Técnica
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Assistência Técnica', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6068249258160238 0.45302013422818793, 0.6350148367952523 0.45302013422818793, 0.6350148367952523 0.49916107382550334, 0.6068249258160238 0.49916107382550334, 0.6068249258160238 0.45302013422818793))', 4326))
  RETURNING id INTO v_unit_id_10;

  -- Room: Secretaria
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Secretaria', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.46735905044510384 0.3271812080536913, 0.586053412462908 0.3271812080536913, 0.586053412462908 0.4320469798657718, 0.46735905044510384 0.4320469798657718, 0.46735905044510384 0.3271812080536913))', 4326))
  RETURNING id INTO v_unit_id_11;

  -- Room: Coordenação Pós Graduação 2
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Coordenação Pós Graduação 2', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.586053412462908 0.38800335570469796, 0.6142433234421365 0.38800335570469796, 0.6142433234421365 0.4320469798657718, 0.586053412462908 0.4320469798657718, 0.586053412462908 0.38800335570469796))', 4326))
  RETURNING id INTO v_unit_id_12;

  -- Room: Copa
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Copa', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6142433234421365 0.38800335570469796, 0.6350148367952523 0.38800335570469796, 0.6350148367952523 0.4320469798657718, 0.6142433234421365 0.4320469798657718, 0.6142433234421365 0.38800335570469796))', 4326))
  RETURNING id INTO v_unit_id_13;

  -- Room: Sala de Professor 135
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 135', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.6166107382550335, 0.6943620178041543 0.6166107382550335, 0.6943620178041543 0.6459731543624161, 0.6528189910979229 0.6459731543624161, 0.6528189910979229 0.6166107382550335))', 4326))
  RETURNING id INTO v_unit_id_14;

  -- Room: Sala de Professor 134
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 134', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.6459731543624161, 0.6943620178041543 0.6459731543624161, 0.6943620178041543 0.6753355704697986, 0.6528189910979229 0.6753355704697986, 0.6528189910979229 0.6459731543624161))', 4326))
  RETURNING id INTO v_unit_id_15;

  -- Room: Sala de Professor 133
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 133', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.6753355704697986, 0.6943620178041543 0.6753355704697986, 0.6943620178041543 0.7046979865771812, 0.6528189910979229 0.7046979865771812, 0.6528189910979229 0.6753355704697986))', 4326))
  RETURNING id INTO v_unit_id_16;

  -- Room: Sala de Professor 132
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 132', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.7046979865771812, 0.6943620178041543 0.7046979865771812, 0.6943620178041543 0.7361577181208053, 0.6528189910979229 0.7361577181208053, 0.6528189910979229 0.7046979865771812))', 4326))
  RETURNING id INTO v_unit_id_17;

  -- Room: Sala de Professor 131
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 131', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.7361577181208053, 0.6943620178041543 0.7361577181208053, 0.6943620178041543 0.7655201342281879, 0.6528189910979229 0.7655201342281879, 0.6528189910979229 0.7361577181208053))', 4326))
  RETURNING id INTO v_unit_id_18;

  -- Room: Sala de Professor 130
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 130', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.7655201342281879, 0.6943620178041543 0.7655201342281879, 0.6943620178041543 0.7948825503355704, 0.6528189910979229 0.7948825503355704, 0.6528189910979229 0.7655201342281879))', 4326))
  RETURNING id INTO v_unit_id_19;

  -- Room: Sala de Professor 129
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 129', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.7634228187919463, 0.7566765578635015 0.7634228187919463, 0.7566765578635015 0.7948825503355704, 0.7136498516320475 0.7948825503355704, 0.7136498516320475 0.7634228187919463))', 4326))
  RETURNING id INTO v_unit_id_20;

  -- Room: Sala de Professor 128
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 128', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.7340604026845637, 0.7566765578635015 0.7340604026845637, 0.7566765578635015 0.7634228187919463, 0.7136498516320475 0.7634228187919463, 0.7136498516320475 0.7340604026845637))', 4326))
  RETURNING id INTO v_unit_id_21;

  -- Room: Sala de Professor 127
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 127', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.7046979865771812, 0.7566765578635015 0.7046979865771812, 0.7566765578635015 0.7340604026845637, 0.7136498516320475 0.7340604026845637, 0.7136498516320475 0.7046979865771812))', 4326))
  RETURNING id INTO v_unit_id_22;

  -- Room: Sala de Professor 126
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 126', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.6753355704697986, 0.7566765578635015 0.6753355704697986, 0.7566765578635015 0.7046979865771812, 0.7136498516320475 0.7046979865771812, 0.7136498516320475 0.6753355704697986))', 4326))
  RETURNING id INTO v_unit_id_23;

  -- Room: Sala de Professor 125
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 125', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.6459731543624161, 0.7566765578635015 0.6459731543624161, 0.7566765578635015 0.6753355704697986, 0.7136498516320475 0.6753355704697986, 0.7136498516320475 0.6459731543624161))', 4326))
  RETURNING id INTO v_unit_id_24;

  -- Room: Sala de Professor 124
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 124', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.6166107382550335, 0.7566765578635015 0.6166107382550335, 0.7566765578635015 0.6459731543624161, 0.7136498516320475 0.6459731543624161, 0.7136498516320475 0.6166107382550335))', 4326))
  RETURNING id INTO v_unit_id_25;

  -- Room: Banheiro Masculino Servidor
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Masculino Servidor', 'banheiro', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5809563758389261, 0.7566765578635015 0.5809563758389261, 0.7566765578635015 0.614513422818792, 0.7136498516320475 0.614513422818792, 0.7136498516320475 0.5809563758389261))', 4326))
  RETURNING id INTO v_unit_id_26;

  -- Room: Banheiro Feminino Servidor
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Feminino Servidor', 'banheiro', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5432046979865772, 0.7566765578635015 0.5432046979865772, 0.7566765578635015 0.5788590604026845, 0.7136498516320475 0.5788590604026845, 0.7136498516320475 0.5432046979865772))', 4326))
  RETURNING id INTO v_unit_id_27;

  -- Room: Almoxarifado
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Almoxarifado', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5138422818791947, 0.7566765578635015 0.5138422818791947, 0.7566765578635015 0.5432046979865772, 0.7136498516320475 0.5432046979865772, 0.7136498516320475 0.5138422818791947))', 4326))
  RETURNING id INTO v_unit_id_28;

  -- Room: Sala de Reunião 2 
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Reunião 2 ', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.48447986577181207, 0.7566765578635015 0.48447986577181207, 0.7566765578635015 0.5138422818791947, 0.7136498516320475 0.5138422818791947, 0.7136498516320475 0.48447986577181207))', 4326))
  RETURNING id INTO v_unit_id_29;

  -- Room: Sala de Reunião 3
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Reunião 3', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.4551174496644295, 0.7566765578635015 0.4551174496644295, 0.7566765578635015 0.48447986577181207, 0.7136498516320475 0.48447986577181207, 0.7136498516320475 0.4551174496644295))', 4326))
  RETURNING id INTO v_unit_id_30;

  -- Room: Sala de Professor 120
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 120', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.42575503355704697, 0.7566765578635015 0.42575503355704697, 0.7566765578635015 0.4551174496644295, 0.7136498516320475 0.4551174496644295, 0.7136498516320475 0.42575503355704697))', 4326))
  RETURNING id INTO v_unit_id_31;

  -- Room: Sala de Professor 119
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 119', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.3963926174496644, 0.7566765578635015 0.3963926174496644, 0.7566765578635015 0.42575503355704697, 0.7136498516320475 0.42575503355704697, 0.7136498516320475 0.3963926174496644))', 4326))
  RETURNING id INTO v_unit_id_32;

  -- Room: Sala de Professor 118
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 118', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.36703020134228187, 0.7566765578635015 0.36703020134228187, 0.7566765578635015 0.3963926174496644, 0.7136498516320475 0.3963926174496644, 0.7136498516320475 0.36703020134228187))', 4326))
  RETURNING id INTO v_unit_id_33;

  -- Room: Sala de Professor 117
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 117', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.3376677852348993, 0.7566765578635015 0.3376677852348993, 0.7566765578635015 0.36703020134228187, 0.7136498516320475 0.36703020134228187, 0.7136498516320475 0.3376677852348993))', 4326))
  RETURNING id INTO v_unit_id_34;

  -- Room: Sala de Professor 116
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 116', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.30830536912751677, 0.7566765578635015 0.30830536912751677, 0.7566765578635015 0.3376677852348993, 0.7136498516320475 0.3376677852348993, 0.7136498516320475 0.30830536912751677))', 4326))
  RETURNING id INTO v_unit_id_35;

  -- Room: Sala de Professor 115
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 115', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.2789429530201342, 0.7566765578635015 0.2789429530201342, 0.7566765578635015 0.30830536912751677, 0.7136498516320475 0.30830536912751677, 0.7136498516320475 0.2789429530201342))', 4326))
  RETURNING id INTO v_unit_id_36;

  -- Room: Sala de Professor 114
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 114', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.24958053691275167, 0.7566765578635015 0.24958053691275167, 0.7566765578635015 0.2789429530201342, 0.7136498516320475 0.2789429530201342, 0.7136498516320475 0.24958053691275167))', 4326))
  RETURNING id INTO v_unit_id_37;

  -- Room: Sala de Professor 113
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 113', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.22021812080536912, 0.7566765578635015 0.22021812080536912, 0.7566765578635015 0.24958053691275167, 0.7136498516320475 0.24958053691275167, 0.7136498516320475 0.22021812080536912))', 4326))
  RETURNING id INTO v_unit_id_38;

  -- Room: Sala de Professor 112
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 112', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.19085570469798657, 0.7566765578635015 0.19085570469798657, 0.7566765578635015 0.22021812080536912, 0.7136498516320475 0.22021812080536912, 0.7136498516320475 0.19085570469798657))', 4326))
  RETURNING id INTO v_unit_id_39;

  -- Room: Sala de Professor 111
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 111', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.16149328859060402, 0.7566765578635015 0.16149328859060402, 0.7566765578635015 0.19085570469798657, 0.7136498516320475 0.19085570469798657, 0.7136498516320475 0.16149328859060402))', 4326))
  RETURNING id INTO v_unit_id_40;

  -- Room: Sala de Professor 110
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 110', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.13003355704697986, 0.7566765578635015 0.13003355704697986, 0.7566765578635015 0.16149328859060402, 0.7136498516320475 0.16149328859060402, 0.7136498516320475 0.13003355704697986))', 4326))
  RETURNING id INTO v_unit_id_41;

  -- Room: Sala de Professor 109
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 109', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.13003355704697986, 0.6943620178041543 0.13003355704697986, 0.6943620178041543 0.1593959731543624, 0.655786350148368 0.1593959731543624, 0.655786350148368 0.13003355704697986))', 4326))
  RETURNING id INTO v_unit_id_42;

  -- Room: Sala de Professor 108
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 108', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.1593959731543624, 0.6943620178041543 0.1593959731543624, 0.6943620178041543 0.18875838926174496, 0.655786350148368 0.18875838926174496, 0.655786350148368 0.1593959731543624))', 4326))
  RETURNING id INTO v_unit_id_43;

  -- Room: Sala de Professor 107
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 107', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.18875838926174496, 0.6943620178041543 0.18875838926174496, 0.6943620178041543 0.2181208053691275, 0.655786350148368 0.2181208053691275, 0.655786350148368 0.18875838926174496))', 4326))
  RETURNING id INTO v_unit_id_44;

  -- Room: Sala de Professor 106
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 106', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.2181208053691275, 0.6943620178041543 0.2181208053691275, 0.6943620178041543 0.24748322147651006, 0.655786350148368 0.24748322147651006, 0.655786350148368 0.2181208053691275))', 4326))
  RETURNING id INTO v_unit_id_45;

  -- Room: Sala de Professor 105
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 105', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.24748322147651006, 0.6943620178041543 0.24748322147651006, 0.6943620178041543 0.27684563758389263, 0.655786350148368 0.27684563758389263, 0.655786350148368 0.24748322147651006))', 4326))
  RETURNING id INTO v_unit_id_46;

  -- Room: Sala de Professor 104
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 104', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.27684563758389263, 0.6943620178041543 0.27684563758389263, 0.6943620178041543 0.3062080536912752, 0.655786350148368 0.3062080536912752, 0.655786350148368 0.27684563758389263))', 4326))
  RETURNING id INTO v_unit_id_47;

  -- Room: Sala de Professor 103
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 103', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.3062080536912752, 0.6943620178041543 0.3062080536912752, 0.6943620178041543 0.33557046979865773, 0.655786350148368 0.33557046979865773, 0.655786350148368 0.3062080536912752))', 4326))
  RETURNING id INTO v_unit_id_48;

  -- Room: Sala de Professor 102
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 102', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.33557046979865773, 0.6943620178041543 0.33557046979865773, 0.6943620178041543 0.3649328859060403, 0.655786350148368 0.3649328859060403, 0.655786350148368 0.33557046979865773))', 4326))
  RETURNING id INTO v_unit_id_49;

  -- Room: Sala de Professor 101
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 101', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.3649328859060403, 0.6943620178041543 0.3649328859060403, 0.6943620178041543 0.39429530201342283, 0.655786350148368 0.39429530201342283, 0.655786350148368 0.3649328859060403))', 4326))
  RETURNING id INTO v_unit_id_50;

  -- Room: Sala de Professor 100
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 100', 'sala', v_space_id, v_version, 0, 1, false,
    ST_GeomFromText('POLYGON((0.655786350148368 0.39429530201342283, 0.6943620178041543 0.39429530201342283, 0.6943620178041543 0.42575503355704697, 0.655786350148368 0.42575503355704697, 0.655786350148368 0.39429530201342283))', 4326))
  RETURNING id INTO v_unit_id_51;

  -- Room: Laboratório 254
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 254', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.1661721068249258 0.4886744966442953, 0.21810089020771514 0.4886744966442953, 0.21810089020771514 0.5809563758389261, 0.1661721068249258 0.5809563758389261, 0.1661721068249258 0.4886744966442953))', 4326))
  RETURNING id INTO v_unit_id_52;

  -- Room: Laboratório 255
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 255', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.2195845697329377 0.4886744966442953, 0.27002967359050445 0.4886744966442953, 0.27002967359050445 0.5809563758389261, 0.2195845697329377 0.5809563758389261, 0.2195845697329377 0.4886744966442953))', 4326))
  RETURNING id INTO v_unit_id_53;

  -- Room: Laboratório 256
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 256', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.271513353115727 0.4886744966442953, 0.3219584569732938 0.4886744966442953, 0.3219584569732938 0.5809563758389261, 0.271513353115727 0.5809563758389261, 0.271513353115727 0.4886744966442953))', 4326))
  RETURNING id INTO v_unit_id_54;

  -- Room: Laboratório 257
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 257', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.32344213649851633 0.4886744966442953, 0.37537091988130566 0.4886744966442953, 0.37537091988130566 0.5809563758389261, 0.32344213649851633 0.5809563758389261, 0.32344213649851633 0.4886744966442953))', 4326))
  RETURNING id INTO v_unit_id_55;

  -- Room: Laboratório 253
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 253', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.1661721068249258 0.614513422818792, 0.21810089020771514 0.614513422818792, 0.21810089020771514 0.7067953020134228, 0.1661721068249258 0.7067953020134228, 0.1661721068249258 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_56;

  -- Room: Laboratório 252
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 252', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.21810089020771514 0.614513422818792, 0.27002967359050445 0.614513422818792, 0.27002967359050445 0.7067953020134228, 0.21810089020771514 0.7067953020134228, 0.21810089020771514 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_57;

  -- Room: Laboratório 251
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 251', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.27002967359050445 0.614513422818792, 0.3219584569732938 0.614513422818792, 0.3219584569732938 0.7046979865771812, 0.27002967359050445 0.7046979865771812, 0.27002967359050445 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_58;

  -- Room: Laboratório 250
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 250', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.32344213649851633 0.614513422818792, 0.37537091988130566 0.614513422818792, 0.37537091988130566 0.7046979865771812, 0.32344213649851633 0.7046979865771812, 0.32344213649851633 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_59;

  -- Room: Banheiro Feminino 2
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Feminino 2', 'banheiro', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.3768545994065282 0.614513422818792, 0.4065281899109792 0.614513422818792, 0.4065281899109792 0.7235738255033557, 0.3768545994065282 0.7235738255033557, 0.3768545994065282 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_60;

  -- Room: Banheiro Masculino
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Masculino', 'banheiro', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.4065281899109792 0.614513422818792, 0.43768545994065283 0.614513422818792, 0.43768545994065283 0.7214765100671141, 0.4065281899109792 0.7214765100671141, 0.4065281899109792 0.614513422818792))', 4326))
  RETURNING id INTO v_unit_id_61;

  -- Room: Laboratório 244
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 244', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.41097922848664686 0.4089765100671141, 0.4688427299703264 0.4089765100671141, 0.4688427299703264 0.4697986577181208, 0.41097922848664686 0.4697986577181208, 0.41097922848664686 0.4089765100671141))', 4326))
  RETURNING id INTO v_unit_id_62;

  -- Room: Laboratório 243
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 243', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.4688427299703264 0.38800335570469796, 0.5103857566765578 0.38800335570469796, 0.5103857566765578 0.4697986577181208, 0.4688427299703264 0.4697986577181208, 0.4688427299703264 0.38800335570469796))', 4326))
  RETURNING id INTO v_unit_id_63;

  -- Room: Laboratório 242
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 242', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.5103857566765578 0.3859060402684564, 0.5519287833827893 0.3859060402684564, 0.5519287833827893 0.4697986577181208, 0.5103857566765578 0.4697986577181208, 0.5103857566765578 0.3859060402684564))', 4326))
  RETURNING id INTO v_unit_id_64;

  -- Room: Laboratório 241
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Laboratório 241', 'sala', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.5534124629080118 0.3859060402684564, 0.5949554896142433 0.3859060402684564, 0.5949554896142433 0.4697986577181208, 0.5534124629080118 0.4697986577181208, 0.5534124629080118 0.3859060402684564))', 4326))
  RETURNING id INTO v_unit_id_65;

  -- Room: Sala de Convivência 
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Convivência ', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.5949554896142433 0.3859060402684564, 0.6364985163204748 0.3859060402684564, 0.6364985163204748 0.4697986577181208, 0.5949554896142433 0.4697986577181208, 0.5949554896142433 0.3859060402684564))', 4326))
  RETURNING id INTO v_unit_id_66;

  -- Room: Sala de Professor 235
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 235', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.6166107382550335, 0.6943620178041543 0.6166107382550335, 0.6943620178041543 0.6459731543624161, 0.6528189910979229 0.6459731543624161, 0.6528189910979229 0.6166107382550335))', 4326))
  RETURNING id INTO v_unit_id_67;

  -- Room: Sala de Professor 234
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 234', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6528189910979229 0.6459731543624161, 0.6943620178041543 0.6459731543624161, 0.6943620178041543 0.6753355704697986, 0.6528189910979229 0.6753355704697986, 0.6528189910979229 0.6459731543624161))', 4326))
  RETURNING id INTO v_unit_id_68;

  -- Room: Sala de Professor 233
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 233', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6543026706231454 0.6753355704697986, 0.6943620178041543 0.6753355704697986, 0.6943620178041543 0.7046979865771812, 0.6543026706231454 0.7046979865771812, 0.6543026706231454 0.6753355704697986))', 4326))
  RETURNING id INTO v_unit_id_69;

  -- Room: Sala de Professor 232
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 232', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6543026706231454 0.7046979865771812, 0.6943620178041543 0.7046979865771812, 0.6943620178041543 0.7340604026845637, 0.6543026706231454 0.7340604026845637, 0.6543026706231454 0.7046979865771812))', 4326))
  RETURNING id INTO v_unit_id_70;

  -- Room: Sala de Professor 231
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 231', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6543026706231454 0.7340604026845637, 0.6943620178041543 0.7340604026845637, 0.6943620178041543 0.7634228187919463, 0.6543026706231454 0.7634228187919463, 0.6543026706231454 0.7340604026845637))', 4326))
  RETURNING id INTO v_unit_id_71;

  -- Room: Sala de Professor 230
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 230', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6543026706231454 0.7634228187919463, 0.6943620178041543 0.7634228187919463, 0.6943620178041543 0.7927852348993288, 0.6543026706231454 0.7927852348993288, 0.6543026706231454 0.7634228187919463))', 4326))
  RETURNING id INTO v_unit_id_72;

  -- Room: Sala de Professor 229
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 229', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.7655201342281879, 0.755192878338279 0.7655201342281879, 0.755192878338279 0.7927852348993288, 0.712166172106825 0.7927852348993288, 0.712166172106825 0.7655201342281879))', 4326))
  RETURNING id INTO v_unit_id_73;

  -- Room: Sala de Professor 228
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 228', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.7361577181208053, 0.755192878338279 0.7361577181208053, 0.755192878338279 0.7655201342281879, 0.712166172106825 0.7655201342281879, 0.712166172106825 0.7361577181208053))', 4326))
  RETURNING id INTO v_unit_id_74;

  -- Room: Sala de Professor 227
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 227', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.7046979865771812, 0.7566765578635015 0.7046979865771812, 0.7566765578635015 0.7361577181208053, 0.712166172106825 0.7361577181208053, 0.712166172106825 0.7046979865771812))', 4326))
  RETURNING id INTO v_unit_id_75;

  -- Room: Sala de Professor 226
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 226', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.6753355704697986, 0.7566765578635015 0.6753355704697986, 0.7566765578635015 0.7046979865771812, 0.712166172106825 0.7046979865771812, 0.712166172106825 0.6753355704697986))', 4326))
  RETURNING id INTO v_unit_id_76;

  -- Room: Sala de Professor 225
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 225', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.6459731543624161, 0.7566765578635015 0.6459731543624161, 0.7566765578635015 0.6753355704697986, 0.712166172106825 0.6753355704697986, 0.712166172106825 0.6459731543624161))', 4326))
  RETURNING id INTO v_unit_id_77;

  -- Room: Sala de Professor 224
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 224', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.712166172106825 0.6166107382550335, 0.7566765578635015 0.6166107382550335, 0.7566765578635015 0.6459731543624161, 0.712166172106825 0.6459731543624161, 0.712166172106825 0.6166107382550335))', 4326))
  RETURNING id INTO v_unit_id_78;

  -- Room: Banheiro Masculino Servidor 2
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Masculino Servidor 2', 'banheiro', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5809563758389261, 0.7566765578635015 0.5809563758389261, 0.7566765578635015 0.614513422818792, 0.7136498516320475 0.614513422818792, 0.7136498516320475 0.5809563758389261))', 4326))
  RETURNING id INTO v_unit_id_79;

  -- Room: Banheiro Feminino Servidor 2
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Banheiro Feminino Servidor 2', 'banheiro', v_space_id, v_version, 1, 0, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5432046979865772, 0.7566765578635015 0.5432046979865772, 0.7566765578635015 0.5788590604026845, 0.7136498516320475 0.5788590604026845, 0.7136498516320475 0.5432046979865772))', 4326))
  RETURNING id INTO v_unit_id_80;

  -- Room: Sala de Professor 223
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 223', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.5138422818791947, 0.7566765578635015 0.5138422818791947, 0.7566765578635015 0.5411073825503355, 0.7136498516320475 0.5411073825503355, 0.7136498516320475 0.5138422818791947))', 4326))
  RETURNING id INTO v_unit_id_81;

  -- Room: Sala de Professor 222
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 222', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.48447986577181207, 0.7566765578635015 0.48447986577181207, 0.7566765578635015 0.5138422818791947, 0.7136498516320475 0.5138422818791947, 0.7136498516320475 0.48447986577181207))', 4326))
  RETURNING id INTO v_unit_id_82;

  -- Room: Sala de Professor 221
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 221', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.4551174496644295, 0.7566765578635015 0.4551174496644295, 0.7566765578635015 0.48447986577181207, 0.7136498516320475 0.48447986577181207, 0.7136498516320475 0.4551174496644295))', 4326))
  RETURNING id INTO v_unit_id_83;

  -- Room: Sala de Professor 220
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 220', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.42575503355704697, 0.7566765578635015 0.42575503355704697, 0.7566765578635015 0.4551174496644295, 0.7136498516320475 0.4551174496644295, 0.7136498516320475 0.42575503355704697))', 4326))
  RETURNING id INTO v_unit_id_84;

  -- Room: Sala de Professor 219
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 219', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.3963926174496644, 0.7566765578635015 0.3963926174496644, 0.7566765578635015 0.42575503355704697, 0.7136498516320475 0.42575503355704697, 0.7136498516320475 0.3963926174496644))', 4326))
  RETURNING id INTO v_unit_id_85;

  -- Room: Sala de Professor 218
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 218', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.36703020134228187, 0.7566765578635015 0.36703020134228187, 0.7566765578635015 0.3963926174496644, 0.7136498516320475 0.3963926174496644, 0.7136498516320475 0.36703020134228187))', 4326))
  RETURNING id INTO v_unit_id_86;

  -- Room: Sala de Professor 217
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 217', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.3376677852348993, 0.7566765578635015 0.3376677852348993, 0.7566765578635015 0.36703020134228187, 0.7136498516320475 0.36703020134228187, 0.7136498516320475 0.3376677852348993))', 4326))
  RETURNING id INTO v_unit_id_87;

  -- Room: Sala de Professor 216
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 216', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.3062080536912752, 0.7566765578635015 0.3062080536912752, 0.7566765578635015 0.3376677852348993, 0.7136498516320475 0.3376677852348993, 0.7136498516320475 0.3062080536912752))', 4326))
  RETURNING id INTO v_unit_id_88;

  -- Room: Sala de Professor 215
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 215', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.2789429530201342, 0.7566765578635015 0.2789429530201342, 0.7566765578635015 0.3062080536912752, 0.7136498516320475 0.3062080536912752, 0.7136498516320475 0.2789429530201342))', 4326))
  RETURNING id INTO v_unit_id_89;

  -- Room: Sala de Professor 214
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 214', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.24748322147651006, 0.7566765578635015 0.24748322147651006, 0.7566765578635015 0.2789429530201342, 0.7136498516320475 0.2789429530201342, 0.7136498516320475 0.24748322147651006))', 4326))
  RETURNING id INTO v_unit_id_90;

  -- Room: Sala de Professor 213
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 213', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.22021812080536912, 0.7566765578635015 0.22021812080536912, 0.7566765578635015 0.24748322147651006, 0.7136498516320475 0.24748322147651006, 0.7136498516320475 0.22021812080536912))', 4326))
  RETURNING id INTO v_unit_id_91;

  -- Room: Sala de Professor 212
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 212', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.19085570469798657, 0.7566765578635015 0.19085570469798657, 0.7566765578635015 0.22021812080536912, 0.7136498516320475 0.22021812080536912, 0.7136498516320475 0.19085570469798657))', 4326))
  RETURNING id INTO v_unit_id_92;

  -- Room: Sala de Professor 211
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 211', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.1593959731543624, 0.7566765578635015 0.1593959731543624, 0.7566765578635015 0.19085570469798657, 0.7136498516320475 0.19085570469798657, 0.7136498516320475 0.1593959731543624))', 4326))
  RETURNING id INTO v_unit_id_93;

  -- Room: Sala de Professor 210
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 210', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.7136498516320475 0.13003355704697986, 0.7566765578635015 0.13003355704697986, 0.7566765578635015 0.1593959731543624, 0.7136498516320475 0.1593959731543624, 0.7136498516320475 0.13003355704697986))', 4326))
  RETURNING id INTO v_unit_id_94;

  -- Room: Sala de Professor 209
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 209', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.13003355704697986, 0.6943620178041543 0.13003355704697986, 0.6943620178041543 0.1593959731543624, 0.6617210682492581 0.1593959731543624, 0.6617210682492581 0.13003355704697986))', 4326))
  RETURNING id INTO v_unit_id_95;

  -- Room: Sala de Professor 208
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 208', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.1593959731543624, 0.6943620178041543 0.1593959731543624, 0.6943620178041543 0.18875838926174496, 0.6617210682492581 0.18875838926174496, 0.6617210682492581 0.1593959731543624))', 4326))
  RETURNING id INTO v_unit_id_96;

  -- Room: Sala de Professor 207
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 207', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.18875838926174496, 0.6943620178041543 0.18875838926174496, 0.6943620178041543 0.2181208053691275, 0.6617210682492581 0.2181208053691275, 0.6617210682492581 0.18875838926174496))', 4326))
  RETURNING id INTO v_unit_id_97;

  -- Room: Sala de Professor 206
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 206', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.2181208053691275, 0.6943620178041543 0.2181208053691275, 0.6943620178041543 0.24748322147651006, 0.6617210682492581 0.24748322147651006, 0.6617210682492581 0.2181208053691275))', 4326))
  RETURNING id INTO v_unit_id_98;

  -- Room: Sala de Professor 205
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 205', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.24748322147651006, 0.6943620178041543 0.24748322147651006, 0.6943620178041543 0.27684563758389263, 0.6617210682492581 0.27684563758389263, 0.6617210682492581 0.24748322147651006))', 4326))
  RETURNING id INTO v_unit_id_99;

  -- Room: Sala de Professor 204
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 204', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.27684563758389263, 0.6943620178041543 0.27684563758389263, 0.6943620178041543 0.3062080536912752, 0.6617210682492581 0.3062080536912752, 0.6617210682492581 0.27684563758389263))', 4326))
  RETURNING id INTO v_unit_id_100;

  -- Room: Sala de Professor 203
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 203', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.3062080536912752, 0.6943620178041543 0.3062080536912752, 0.6943620178041543 0.33557046979865773, 0.6617210682492581 0.33557046979865773, 0.6617210682492581 0.3062080536912752))', 4326))
  RETURNING id INTO v_unit_id_101;

  -- Room: Sala de Professor 202
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 202', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.33557046979865773, 0.6943620178041543 0.33557046979865773, 0.6943620178041543 0.3649328859060403, 0.6617210682492581 0.3649328859060403, 0.6617210682492581 0.33557046979865773))', 4326))
  RETURNING id INTO v_unit_id_102;

  -- Room: Sala de Professor 201
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 201', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.3649328859060403, 0.6943620178041543 0.3649328859060403, 0.6943620178041543 0.3963926174496644, 0.6617210682492581 0.3963926174496644, 0.6617210682492581 0.3649328859060403))', 4326))
  RETURNING id INTO v_unit_id_103;

  -- Room: Sala de Professor 200
  INSERT INTO public.unit_polygon (name, unit_type, space_id, space_version, level, restriction_level, is_blocked, geom)
  VALUES ('Sala de Professor 200', 'sala', v_space_id, v_version, 1, 1, false,
    ST_GeomFromText('POLYGON((0.6617210682492581 0.3963926174496644, 0.6943620178041543 0.3963926174496644, 0.6943620178041543 0.42575503355704697, 0.6617210682492581 0.42575503355704697, 0.6617210682492581 0.3963926174496644))', 4326))
  RETURNING id INTO v_unit_id_104;

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 0, 0, 1, 2, 0.667656,
    ST_GeomFromText('LINESTRING(0.16765579 0.59983221, 0.45697329 0.59983221, 0.45697329 0.41526846, 0.45697329 0.44672819, 0.64985163 0.44672819, 0.64985163 0.47609060, 0.64985163 0.49286913, 0.64985163 0.49286913)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('ramp', true, true, v_space_id, v_version, 0, 0, 3, 4, 0.23591,
    ST_GeomFromText('LINESTRING(0.69287834 0.59354027, 0.45697329 0.59144295, 0.45697329 0.59144295)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 0, 0, 3, 5, 0.587537,
    ST_GeomFromText('LINESTRING(0.69287834 0.59354027, 0.70326409 0.59354027, 0.70326409 0.77810403, 0.70326409 0.14681208, 0.70326409 0.14681208)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('stairs', true, false, v_space_id, v_version, 0, 0, 111, 112, 0.053412,
    ST_GeomFromText('LINESTRING(0.64985163 0.46770134, 0.70326409 0.46770134, 0.70326409 0.46770134)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 0, 0, 113, 114, 0.010386,
    ST_GeomFromText('LINESTRING(0.70326409 0.56627517, 0.69287834 0.56627517, 0.69287834 0.56627517, 0.69287834 0.56627517)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('ramp', true, true, v_space_id, v_version, 1, 0, 114, 115, 0.235905,
    ST_GeomFromText('LINESTRING(0.69287834 0.56627517, 0.45697329 0.56627517, 0.45697329 0.56627517, 0.45697329 0.56627517)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 1, 0, 118, 117, 0.547488,
    ST_GeomFromText('LINESTRING(0.16765579 0.60192953, 0.45697329 0.59983221, 0.45697329 0.56627517, 0.45697329 0.48867450, 0.63649852 0.48657718, 0.63649852 0.48657718)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 0, 0, 119, 120, 0.025223,
    ST_GeomFromText('LINESTRING(0.45697329 0.54320470, 0.43175074 0.54320470, 0.43175074 0.54320470)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('stairs', true, false, v_space_id, v_version, 0, 0, 120, 121, 0.090504,
    ST_GeomFromText('LINESTRING(0.43175074 0.54320470, 0.39465875 0.54320470, 0.39465875 0.56837248, 0.43026706 0.56837248, 0.43026706 0.56837248, 0.43026706 0.56837248)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('stairs', true, false, v_space_id, v_version, 1, 0, 121, 115, 0.026706,
    ST_GeomFromText('LINESTRING(0.43026706 0.56837248, 0.45697329 0.56837248, 0.45697329 0.56837248)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 0, 0, 122, 123, 0.019288,
    ST_GeomFromText('LINESTRING(0.70326409 0.49077181, 0.68397626 0.49077181, 0.68397626 0.49077181)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('stairs', true, false, v_space_id, v_version, 0, 0, 123, 124, 0.025223,
    ST_GeomFromText('LINESTRING(0.68397626 0.49077181, 0.65875371 0.49077181, 0.65875371 0.49077181, 0.65875371 0.49077181)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('stairs', true, false, v_space_id, v_version, 1, 0, 124, 117, 0.022452,
    ST_GeomFromText('LINESTRING(0.65875371 0.49077181, 0.63649852 0.48657718, 0.63649852 0.48657718)', 4326));

  INSERT INTO public.edge_line (edge_type, is_walkable, is_accessible, space_id, space_version, level, restriction_level, source, target, cost, geom)
  VALUES ('corridor', true, true, v_space_id, v_version, 1, 0, 125, 126, 0.458462,
    ST_GeomFromText('LINESTRING(0.70474777 0.79278523, 0.70326409 0.46770134, 0.70326409 0.14471477, 0.70326409 0.14471477)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_0, '', ST_GeomFromText('POINT(0.26161810 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_1, '', ST_GeomFromText('POINT(0.27979045 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_3, '', ST_GeomFromText('POINT(0.37039805 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_2, '', ST_GeomFromText('POINT(0.26009315 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_4, '', ST_GeomFromText('POINT(0.40072656 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_5, '', ST_GeomFromText('POINT(0.41692781 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_11, '', ST_GeomFromText('POINT(0.54493292 0.43204698)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_6, '', ST_GeomFromText('POINT(0.51545988 0.45302013)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_7, '', ST_GeomFromText('POINT(0.54577023 0.45302013)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_8, '', ST_GeomFromText('POINT(0.55464563 0.45302013)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_9, '', ST_GeomFromText('POINT(0.60253933 0.45302013)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_10, '', ST_GeomFromText('POINT(0.61141474 0.45302013)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_12, '', ST_GeomFromText('POINT(0.60974013 0.43204698)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_13, '', ST_GeomFromText('POINT(0.61928538 0.43204698)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_19, '', ST_GeomFromText('POINT(0.69436202 0.77231664)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_20, '', ST_GeomFromText('POINT(0.71364985 0.77200376)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_18, '', ST_GeomFromText('POINT(0.69436202 0.75792424)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_21, '', ST_GeomFromText('POINT(0.71364985 0.75823712)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_17, '', ST_GeomFromText('POINT(0.69436202 0.71193112)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_22, '', ST_GeomFromText('POINT(0.71364985 0.71224400)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_16, '', ST_GeomFromText('POINT(0.69436202 0.69691296)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_23, '', ST_GeomFromText('POINT(0.71364985 0.69816447)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_15, '', ST_GeomFromText('POINT(0.69436202 0.65310999)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_24, '', ST_GeomFromText('POINT(0.71364985 0.65373575)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_14, '', ST_GeomFromText('POINT(0.69436202 0.63965622)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_25, '', ST_GeomFromText('POINT(0.71364985 0.64028198)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_26, '', ST_GeomFromText('POINT(0.71364985 0.60993278)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_27, '', ST_GeomFromText('POINT(0.71364985 0.55048589)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_28, '', ST_GeomFromText('POINT(0.71364985 0.51857230)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_29, '', ST_GeomFromText('POINT(0.71364985 0.50730868)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_30, '', ST_GeomFromText('POINT(0.71364985 0.46068981)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_31, '', ST_GeomFromText('POINT(0.71364985 0.44692316)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_32, '', ST_GeomFromText('POINT(0.71364985 0.40124292)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_33, '', ST_GeomFromText('POINT(0.71364985 0.38935354)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_34, '', ST_GeomFromText('POINT(0.71364985 0.34336043)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_35, '', ST_GeomFromText('POINT(0.71364985 0.32959378)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_36, '', ST_GeomFromText('POINT(0.71364985 0.28453930)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_37, '', ST_GeomFromText('POINT(0.71364985 0.27045977)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_38, '', ST_GeomFromText('POINT(0.71364985 0.22415377)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_39, '', ST_GeomFromText('POINT(0.71364985 0.21289015)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_40, '', ST_GeomFromText('POINT(0.71364985 0.16627128)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_41, '', ST_GeomFromText('POINT(0.71364985 0.15187888)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_42, '', ST_GeomFromText('POINT(0.69436202 0.15250463)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_43, '', ST_GeomFromText('POINT(0.69436202 0.16689704)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_44, '', ST_GeomFromText('POINT(0.69436202 0.21163864)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_45, '', ST_GeomFromText('POINT(0.69436202 0.22603104)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_46, '', ST_GeomFromText('POINT(0.69436202 0.27045977)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_47, '', ST_GeomFromText('POINT(0.69436202 0.28453930)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_48, '', ST_GeomFromText('POINT(0.69436202 0.32959378)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_49, '', ST_GeomFromText('POINT(0.69436202 0.34367330)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_50, '', ST_GeomFromText('POINT(0.69436202 0.38810203)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_51, '', ST_GeomFromText('POINT(0.69436202 0.40280731)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_52, '', ST_GeomFromText('POINT(0.21414775 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_53, '', ST_GeomFromText('POINT(0.22333801 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_54, '', ST_GeomFromText('POINT(0.31846963 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_55, '', ST_GeomFromText('POINT(0.32741150 0.58095638)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_56, '', ST_GeomFromText('POINT(0.21414775 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_57, '', ST_GeomFromText('POINT(0.22433155 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_58, '', ST_GeomFromText('POINT(0.31822124 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_59, '', ST_GeomFromText('POINT(0.32765989 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_60, '', ST_GeomFromText('POINT(0.40192713 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_61, '', ST_GeomFromText('POINT(0.41732702 0.61451342)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_62, '', ST_GeomFromText('POINT(0.46327833 0.46979866)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_63, '', ST_GeomFromText('POINT(0.50525546 0.46979866)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_64, '', ST_GeomFromText('POINT(0.54822614 0.46979866)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_65, '', ST_GeomFromText('POINT(0.55766478 0.46979866)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_66, '', ST_GeomFromText('POINT(0.63044171 0.46979866)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_67, '', ST_GeomFromText('POINT(0.69436202 0.63951589)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_68, '', ST_GeomFromText('POINT(0.69436202 0.65343618)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_69, '', ST_GeomFromText('POINT(0.69436202 0.69744887)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_70, '', ST_GeomFromText('POINT(0.69436202 0.71136916)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_71, '', ST_GeomFromText('POINT(0.69436202 0.75681482)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_72, '', ST_GeomFromText('POINT(0.69436202 0.77093982)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_73, '', ST_GeomFromText('POINT(0.71216617 0.77155396)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_74, '', ST_GeomFromText('POINT(0.71216617 0.75865721)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_75, '', ST_GeomFromText('POINT(0.71216617 0.71198329)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_76, '', ST_GeomFromText('POINT(0.71216617 0.69847242)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_77, '', ST_GeomFromText('POINT(0.71216617 0.65261734)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_78, '', ST_GeomFromText('POINT(0.71216617 0.63910647)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_79, '', ST_GeomFromText('POINT(0.71364985 0.61003762)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_80, '', ST_GeomFromText('POINT(0.71364985 0.55067167)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_81, '', ST_GeomFromText('POINT(0.71364985 0.52119341)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_82, '', ST_GeomFromText('POINT(0.71364985 0.50665898)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_83, '', ST_GeomFromText('POINT(0.71364985 0.46039448)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_84, '', ST_GeomFromText('POINT(0.71364985 0.44790716)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_104, '', ST_GeomFromText('POINT(0.69436202 0.40184737)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_85, '', ST_GeomFromText('POINT(0.71364985 0.40184737)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_86, '', ST_GeomFromText('POINT(0.71364985 0.38792708)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_103, '', ST_GeomFromText('POINT(0.69436202 0.38772237)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_102, '', ST_GeomFromText('POINT(0.69436202 0.34330026)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_87, '', ST_GeomFromText('POINT(0.71364985 0.34248142)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_88, '', ST_GeomFromText('POINT(0.71364985 0.32958468)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_101, '', ST_GeomFromText('POINT(0.69436202 0.32815171)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_89, '', ST_GeomFromText('POINT(0.71364985 0.28393431)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_100, '', ST_GeomFromText('POINT(0.69436202 0.28454844)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_90, '', ST_GeomFromText('POINT(0.71364985 0.27103757)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_99, '', ST_GeomFromText('POINT(0.69436202 0.27103757)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_91, '', ST_GeomFromText('POINT(0.71364985 0.22415894)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_98, '', ST_GeomFromText('POINT(0.69436202 0.22354481)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_97, '', ST_GeomFromText('POINT(0.69436202 0.21085277)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_92, '', ST_GeomFromText('POINT(0.71364985 0.21167162)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_93, '', ST_GeomFromText('POINT(0.71364985 0.16622596)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_96, '', ST_GeomFromText('POINT(0.69436202 0.16602125)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_94, '', ST_GeomFromText('POINT(0.71364985 0.15189624)', 4326));

  INSERT INTO public.entry_point (unit_id, description, geom)
  VALUES (v_unit_id_95, '', ST_GeomFromText('POINT(0.69436202 0.15291979)', 4326));

END $$;
COMMIT;

-- REBUILD TOPOLOGY (run after COMMIT)
DROP TABLE IF EXISTS public.edge_line_noded CASCADE;
DROP TABLE IF EXISTS public.edge_line_noded_vertices_pgr CASCADE;
SELECT pgr_nodeNetwork('edge_line', 0.00000001, 'id', 'geom', 'noded');
SELECT pgr_createTopology('edge_line_noded', 0.00000001, 'geom', 'id');
ALTER TABLE public.edge_line_noded ADD COLUMN IF NOT EXISTS cost float;
UPDATE public.edge_line_noded SET cost = ST_Length(geom::geography);

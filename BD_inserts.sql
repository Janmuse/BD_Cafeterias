# rol_trabajador
insert into rol_trabajador(id_rol, rol)
values
(1, 'admin'),
(2, 'cajero-'),
(3, 'capturista');

# ciudad
insert into ciudad(id_ciudad, nombre)
values
(1, 'Macuspana'),
(2, 'San Carlos'),
(3, 'Platanao y Cacao'),
(4, 'Gaviotas'),
(5, 'Luis Gil Perez'),
(6, 'Macultepex'),
(7, 'Rancheria el tigre'),
(8, 'Cucuyulapa');

# categoria
insert into categoria(id_categoria, nombre_categoria)
values
(1, 'Aguas'),
(2, 'Snacks'),
(3, 'Tacos'),
(4, 'Alimentos');

# usuario
insert into usuario(id_usuario, id_rol, username, password_hash, activo)
values
-- arrendatarios (id_rol = 3)
(1,  3, 'arrendatario.p4',  'hash_arr_p4',  1),
(2,  3, 'arrendatario.p6',  'hash_arr_p6',  1),
(3,  3, 'arrendatario.p22', 'hash_arr_p22', 1),
(4,  3, 'arrendatario.p26', 'hash_arr_p26', 1),
(5,  3, 'arrendatario.p30', 'hash_arr_p30', 1),
-- empleados plantel 4 (id_rol = 2)
(6,  2, 'cajero.p4.1', 'hash_p4_e1', 1),
(7,  2, 'cajero.p4.2', 'hash_p4_e2', 1),
(8,  2, 'cajero.p4.3', 'hash_p4_e3', 1),
(9,  2, 'cajero.p4.4', 'hash_p4_e4', 1),
(10, 2, 'cajero.p4.5', 'hash_p4_e5', 1),
-- empleados plantel 6
(11, 2, 'cajero.p6.1', 'hash_p6_e1', 1),
(12, 2, 'cajero.p6.2', 'hash_p6_e2', 1),
(13, 2, 'cajero.p6.3', 'hash_p6_e3', 1),
(14, 2, 'cajero.p6.4', 'hash_p6_e4', 1),
(15, 2, 'cajero.p6.5', 'hash_p6_e5', 1),
-- empleados plantel 22
(16, 2, 'cajero.p22.1', 'hash_p22_e1', 1),
(17, 2, 'cajero.p22.2', 'hash_p22_e2', 1),
(18, 2, 'cajero.p22.3', 'hash_p22_e3', 1),
(19, 2, 'cajero.p22.4', 'hash_p22_e4', 1),
(20, 2, 'cajero.p22.5', 'hash_p22_e5', 1),
-- empleados plantel 26
(21, 2, 'cajero.p26.1', 'hash_p26_e1', 1),
(22, 2, 'cajero.p26.2', 'hash_p26_e2', 1),
(23, 2, 'cajero.p26.3', 'hash_p26_e3', 1),
(24, 2, 'cajero.p26.4', 'hash_p26_e4', 1),
(25, 2, 'cajero.p26.5', 'hash_p26_e5', 1),
-- empleados plantel 30
(26, 2, 'cajero.p30.1', 'hash_p30_e1', 1),
(27, 2, 'cajero.p30.2', 'hash_p30_e2', 1),
(28, 2, 'cajero.p30.3', 'hash_p30_e3', 1),
(29, 2, 'cajero.p30.4', 'hash_p30_e4', 1),
(30, 2, 'cajero.p30.5', 'hash_p30_e5', 1);

# sucursal
insert into sucursal(id_sucursal, nombre, direccion, id_ciudad)
values
(1, 'Plantel 4',  'Prolongación Blasillo S/N-Km. 2',         1),
(2, 'Plantel 6',  'Calle Rancho Landero',                     1),
(3, 'Plantel 22', 'Benito Juárez 1442',                       2),
(4, 'Plantel 26', 'Carretera Villahermosa-Cárdenas KM. 500', 3),
(5, 'Plantel 30', 'Cto. Municipal, Gaviotas Nte',             4);

# empleado
insert into empleado(id_empleado, nombre, apellido_pat, apellido_mat, telefono, id_usuario, id_sucursal)
values
-- plantel 4
(1,  'Luis',      'Sanchez',   'Ruiz',      '9932001001', 6,  1),
(2,  'Martha',    'Martinez',  'Tonatiuh',  '9932001002', 7,  1),
(3,  'Juan',      'Rivera',    'Vazquez',   '9932001003', 8,  1),
(4,  'Gabriela',  'Cardenas',  'Zenteno',   '9932001004', 9,  1),
(5,  'Pedro',     'Flores',    'Perez',     '9932001005', 10, 1),
-- plantel 6
(6,  'Roberto',   'Gutierrez', 'Ramos',     '9932001006', 11, 2),
(7,  'Rosa',      'Torres',    'Rodriguez', '9932001007', 12, 2),
(8,  'Manuel',    'Vargas',    'Morales',   '9932001008', 13, 2),
(9,  'Jessica',   'Robles',    'Jimenez',   '9932001009', 14, 2),
(10, 'Carlos',    'Cruz',      'Mendoza',   '9932001010', 15, 2),
-- plantel 22
(11, 'Monica',    'Morales',   'Reyes',     '9932001011', 16, 3),
(12, 'Jose',      'Espinoza',  'Pacheco',   '9932001012', 17, 3),
(13, 'Yessica',   'Ramos',     'Maldonado', '9932001013', 18, 3),
(14, 'Ricardo',   'Delgado',   'Ruiz',      '9932001014', 19, 3),
(15, 'Carmen',    'Nunez',     'Castillo',  '9932001015', 20, 3),
-- plantel 26
(16, 'Rafael',    'Ortega',    'Trujillo',  '9932001016', 21, 4),
(17, 'Laura',     'Medina',    'Luna',      '9932001017', 22, 4),
(18, 'Julian',    'Aguilar',   'Juarez',    '9932001018', 23, 4),
(19, 'Mariana',   'Solis',     'Miranda',   '9932001019', 24, 4),
(20, 'Raul',      'Castillo',  'Serrano',   '9932001020', 25, 4),
-- plantel 30
(21, 'Andres',    'Leon',      'Ochoa',     '9932001021', 26, 5),
(22, 'Patricia',  'Jimenez',   'Pineda',    '9932001022', 27, 5),
(23, 'Francisco', 'Ramirez',   'Fuentes',   '9932001023', 28, 5),
(24, 'Veronica',  'Cervantes', 'Vega',      '9932001024', 29, 5),
(25, 'Hugo',      'Pacheco',   'Hernandez', '9932001025', 30, 5);

# arrendatario
insert into arrendatario(id_arrendatario, nombre, apellido_pat, apellido_mat, telefono, id_usuario, id_sucursal)
values
(1, 'Miguel',   'Garcia',    'Ramirez',  '9931001001', 1, 1),
(2, 'Fernando', 'Lopez',     'Flores',   '9931001002', 2, 2),
(3, 'Gerardo',  'Hernandez', 'Rios',     '9931001003', 3, 3),
(4, 'Maria',    'Perez',     'Martinez', '9931001004', 4, 4),
(5, 'Jorge',    'Toledo',    'Jimenez',  '9931001005', 5, 5);

# producto
insert into producto(id_producto, id_categoria, nombre_producto, unidad_medida, costo_producto, precio_venta)
values
-- categoria 1 = aguas
(1,  1, 'AGUA NATURAL 500 ML',      'PIEZA',  2.46,  11.00),
(2,  1, 'AGUA NATURAL 1 LT',        'PIEZA',  4.09,  16.00),
(3,  1, 'AGUA DE JAMAICA 700 ML',   'PIEZA', 10.00,  20.00),
(4,  1, 'AGUA DE MARACUYA 700 ML',  'PIEZA', 10.00,  20.00),
(5,  1, 'AGUA DE HORCHATA',         'PIEZA', 10.00,  20.00),
(6,  1, 'FUZZE TEA 600 ML',         'PIEZA', 16.37,  26.00),
(7,  1, 'LECHE SANTA CLARA 180 ML', 'PIEZA',  9.80,  16.00),
(8,  1, 'VASO DE POZOL 1 LITRO',    'PIEZA',  0.00,  20.00),
(9,  1, 'VASO DE POZOL 1/2 LITRO',  'PIEZA',  0.00,  10.00),
(10, 1, 'BOING UVA',                'PIEZA', 12.50,  25.00),
(11, 1, 'BOING MANZANA',            'PIEZA', 12.50,  25.00),
(12, 1, 'BOING MANGO',              'PIEZA', 12.50,  25.00),
(13, 1, 'BOING FRESA',              'PIEZA', 12.50,  25.00),
(14, 1, 'YOGURT VARIOS SABORES',    'PIEZA', 10.00,  15.00),
(15, 1, 'AGUA CHIA/LIMON',          'PIEZA',  0.00,  20.00),
(16, 1, 'JUGO NECTAR',              'PIEZA',  0.00,   0.00),
(17, 1, 'COCA COLA',                'PIEZA',  0.00,  26.00),
(18, 1, 'SPRITE 600 ML',            'PIEZA',  0.00,  26.00),
(19, 1, 'MUNDET 600 ML',            'PIEZA',  0.00,  26.00),
(20, 1, 'FRESCA 600 ML',            'PIEZA',  0.00,  26.00),
(21, 1, 'SENZAO 600 ML',            'PIEZA',  0.00,  26.00),
(22, 1, 'VASO CON FRUTAS',          'PIEZA',  0.00,  25.00),
(23, 1, 'GELATINA MOSAICO',         'PIEZA',  0.00,  20.00),
(24, 1, 'FLAN',                     'PIEZA',  0.00,  20.00),
(25, 1, 'CAFÉ',                     'PIEZA',  0.00,  18.00),
(26, 1, 'LIMONADA',                 'PIEZA',  0.00,  15.00),
(27, 1, 'PEÑAFIEL MINERAL',         'PIEZA',  0.00,  20.00),
(28, 1, 'BONAFON',                  'PIEZA',  0.00,  20.00),
(29, 1, 'AGUA PEÑAFIEL',            'PIEZA',  0.00,  20.00),
(30, 1, 'AGUA DE NARANJA',          'PIEZA',  0.00,  20.00),
(31, 1, 'COCA COLA 600 ML',         'PIEZA',  0.00,  18.00),
(32, 1, 'JUGO VALLE',               'PIEZA',  0.00,  18.00),
(33, 1, 'GATORADE SURTIDO',         'PIEZA',  0.00,  40.00),
(34, 1, 'VASO DE POZOL',            'PIEZA',  0.00,  15.00),
(35, 1, 'CHOCOMILK',                'PIEZA',  0.00,  20.00),
(36, 1, 'GATORADE SURTIDO 600 ML',  'PIEZA',  0.00,  25.00),
(37, 1, 'CAFÉ CON LECHE',           'TAZA',   0.00,  20.00),
(38, 1, 'VASO DE JAMAICA',          'VASO',   0.00,  15.00),
(39, 1, 'BOLIS Y FRIOLIN',          'PIEZA',  0.00,  12.00),
(40, 1, 'GATORADE 355 ML',          'PIEZA',  0.00,  20.00),
(41, 1, 'VASO DESECHABLE',          'PIEZA',  0.00,   2.00),
-- categoria 2 = snacks
(42, 2, 'CACAHUATE SALADO',             'PIEZA',  5.00, 10.00),
(43, 2, 'CACAHUATE JAPONES',            'PIEZA',  7.00, 15.00),
(44, 2, 'CACAHUATE ENCHILADOS',         'PIEZA',  5.00, 10.00),
(45, 2, 'CACAHUATE TIPO HOT NUT',       'PIEZA',  9.00, 15.00),
(46, 2, 'PLATANITOS ADOBADOS',          'PIEZA', 10.50, 15.00),
(47, 2, 'PLATANITOS RUFFLES',           'PIEZA', 10.50, 15.00),
(48, 2, 'PLATANITOS TAKIS FUEGO',       'PIEZA', 10.50, 15.00),
(49, 2, 'PLATANITOS DORITOS NACHOS',    'PIEZA', 10.50, 15.00),
(50, 2, 'PLATANITOS FLAMIN HOT',        'PIEZA', 10.50, 15.00),
(51, 2, 'GALLETAS PEKEPAKES',           'PIEZA',  3.95, 10.00),
(52, 2, 'GALLETAS OREO',                'PIEZA', 14.23, 25.00),
(53, 2, 'BARRITAS FRESA',               'PAQ',    6.55, 15.00),
(54, 2, 'CHICLES 3 PIEZAS',             'PAQ',    2.62,  5.00),
(55, 2, 'BARRITAS PIÑA',                'PAQ',    6.55, 15.00),
(56, 2, 'GALLETAS SURTIDO GAMESA',      'PAQ',   12.50, 20.00),
(57, 2, 'CHICHARRONES',                 'PIEZA',  0.00,  0.00),
(58, 2, 'SABRITAS',                     'PIEZA',  0.00,  0.00),
(59, 2, 'PALETA DE BOMBA CHILE',        'PIEZA',  0.00,  5.00),
(60, 2, 'PALOMITA',                     'PZA',    0.00, 20.00),
(61, 2, 'BOMBOM',                       'PZA',    0.00, 12.00),
(62, 2, 'BOLSA SURTIDA',                'PZA',    0.00, 25.00),
(63, 2, 'TILIKO',                       'PZA',    0.00,  5.00),
(64, 2, 'PIZZA CON QUESO',              'PZA',    0.00, 20.00),
(65, 2, 'KINDER',                       'PZA',    0.00, 25.00),
(66, 2, 'CARLOS V',                     'PZA',    0.00, 15.00),
(67, 2, 'LUCAS',                        'PZA',    0.00, 15.00),
(68, 2, 'MAMUT',                        'PZA',    0.00, 10.00),
(69, 2, 'EMPERADOR Y ARCOIRIS',         'PAQ',    0.00, 25.00),
(70, 2, 'FLORENTINAS Y CHOQUIS',        'PAQ',    0.00, 20.00),
(71, 2, 'GOMITAS',                      'PAQ',    0.00, 12.00),
(72, 2, 'LUKAS',                        'PIEZA',  0.00, 15.00),
(73, 2, 'CHOKIS',                       'PIEZA',  0.00, 20.00),
(74, 2, 'BARCEL',                       'PIEZA',  0.00, 17.00),
(75, 2, 'PAPITAS',                      'PIEZA',  0.00, 15.00),
(76, 2, 'CHURRUMAS/FRITOS',             'PIEZA',  0.00, 12.00),
(77, 2, 'CHIDAS LOCO MILK',             'PIEZA',  0.00, 20.00),
(78, 2, 'CHIDAS SUPER PICOSAS',         'PIEZA',  0.00, 20.00),
(79, 2, 'CHIDAS SALSA VERDE',           'PIEZA',  0.00, 20.00),
(80, 2, 'CHIDAS ADOBADAS',              'PIEZA',  0.00, 20.00),
(81, 2, 'CHIDAS PICOSAS',               'PIEZA',  0.00, 20.00),
(82, 2, 'CHIDAS PAPAS SALADAS',         'PIEZA',  0.00, 20.00),
(83, 2, 'CHIDAS AROS DE LIMON',         'PIEZA',  0.00, 15.00),
(84, 2, 'CHOCORETAS/CARLO V',           'PIEZA',  0.00,  5.00),
(85, 2, 'HELADO',                       'PIEZA',  0.00,  0.00),
(86, 2, 'DULCES CHAMOY/SANDIA/MANGO',   'PIEZA',  0.00,  3.00),
(87, 2, 'MINI MAMUT',                   'PIEZA',  0.00,  5.00),
(88, 2, 'CHIDAS AROS DE CHILE',         'PIEZA',  0.00, 15.00),
(89, 2, 'PALETA DE PICAFRESA',          'PIEZA',  0.00, 10.00),
(90, 2, 'PALETA DEDO/CUPIDO',           'PIEZA',  0.00,  5.00),
(91, 2, 'HOJALDA CHICA',                'PIEZA',  0.00, 20.00),
(92, 2, 'HOJALDA GRANDE',               'PIEZA',  0.00, 25.00),
(93, 2, 'PALOMITAS C/CHILE',            'PIEZA',  0.00, 20.00),
(94, 2, 'CHOCOLATES/NIKOLOS/CREMINOS',  'PIEZA',  0.00,  5.00),
(95, 2, 'JICAMAS PREPARADAS',           'PIEZA',  0.00, 20.00),
(96, 2, 'ROCALETA',                     'PIEZA',  0.00, 10.00),
(97, 2, 'CREMINOS',                     'PIEZA',  0.00,  6.00),
(98, 2, 'PULPARINDO',                   'PIEZA',  0.00,  5.00),
-- categoria 3 = tacos
(99,  3, 'COCHINITA PIBIL',            'KG',    210.00, 15.00),
(100, 3, 'EMPANIZADO DE CERDO',        'KG',    210.00, 15.00),
(101, 3, 'PIERNA (CERDO)',             'KG',    210.00, 15.00),
(102, 3, 'BARBACOA',                   'KG',    210.00, 15.00),
(103, 3, 'PASTOR',                     'KG',    210.00, 15.00),
(104, 3, 'HOT DOG PAQ DE 2 PIEZAS',   'PAQ',     0.00, 35.00),
(105, 3, 'HOT DOG',                    'PIEZA',   0.00, 20.00),
(106, 3, 'SALCHIPAPAS',                'PAQ',     0.00, 35.00),
(107, 3, 'NUGETS ORDEN DE 10 PIEZAS',  'PAQ',     0.00, 35.00),
(108, 3, 'NUGETS ORDEN DE 08 PIEZAS',  'PAQ',     0.00, 40.00),
(109, 3, 'ASADA',                      'KG',      0.00, 15.00),
(110, 3, 'EMPANIZADO DE POLLO',        'KG',      0.00, 15.00),
(111, 3, 'COCA COLA 3 LTS',            'PZA',     0.00, 65.00),
(112, 3, 'HAMBURGUESA CON PAPAS',      'PAQ',     0.00, 50.00),
(113, 3, 'ALITAS',                     'ORDEN',   0.00, 50.00),
(114, 3, 'SALCHICHA ENCHIPOTLADA',     'ORDEN',   0.00, 35.00),
(115, 3, 'PLATILLO CARNE POLACA',      'ORDEN',   0.00, 35.00),
(116, 3, 'BUDIN',                      'PIEZA',   0.00, 20.00),
(117, 3, 'CARNE CON PAPA',             'PIEZA',   0.00, 15.00),
(118, 3, 'SOPA NISSIN',                'PIEZA',   0.00, 25.00),
(119, 3, 'TACOS CARNE CON PAPAS',      'PIEZA',   0.00, 15.00),
(120, 3, 'SALBUTES',                   'PIEZA',   0.00, 15.00),
(121, 3, 'EMPANADAS',                  'PIEZA',   0.00, 12.00),
(122, 3, 'TORTA DE CARNE CON PAPAS',   'ORDEN',   0.00, 30.00),
(123, 3, 'SPAGUETTI',                  'ORDEN',   0.00, 25.00),
(124, 3, 'QUESATACOS ASADA',           'ORDEN',   0.00, 25.00),
(125, 3, 'QUESATACOS PASTOR',          'ORDEN',   0.00, 25.00),
(126, 3, 'QUESATACOS EMPANIZADO',      'ORDEN',   0.00, 25.00),
-- categoria 4 = alimentos
(127, 4, 'SANDWICH DE JAMON/QUESO',           'PIEZA',  0.00, 20.00),
(128, 4, 'TORTA DE COCHINITA PIBIL',           'PIEZA', 17.50, 30.00),
(129, 4, 'TORTA DE EMPANIZADO DE CERDO',       'PIEZA', 17.50, 45.00),
(130, 4, 'TORTA DE PIERNA (CERDO)',            'PIEZA', 17.50, 30.00),
(131, 4, 'QUESADILLA DE TORTILLA DE YUCA',     'PIEZA',  0.00, 50.00),
(132, 4, 'QUESADILLA DE JAMON Y QUESO',        'PIEZA',  0.00, 20.00),
(133, 4, 'QUESABIRRIA',                        'PIEZA',  0.00, 25.00),
(134, 4, 'TORTA DE PASTOR',                    'PIEZA',  0.00, 45.00),
(135, 4, 'SANDWICH DE EMPANIZADO',             'PIEZA',  0.00, 25.00),
(136, 4, 'HAMBURGUESAS',                       'PIEZA',  0.00, 40.00),
(137, 4, 'TACOS AL PASTOR',                    'ORDEN',  0.00, 40.00),
(138, 4, 'SANDWICH DE PIBIL',                  'PIEZA',  0.00, 25.00),
(139, 4, 'TORTA DE PIERNA (CERDO) 30',         'PIEZA',  0.00, 30.00),
(140, 4, 'QUESADILLA DE PASTOR',               'PIEZA',  0.00, 35.00),
(141, 4, 'TORTA TINGA',                        'PIEZA',  0.00, 30.00),
(142, 4, 'TORTA DE EMPANIZADO DE POLLO',       'PIEZA',  0.00, 30.00),
(143, 4, 'TORTA ASADA',                        'PZA',    0.00, 30.00),
(144, 4, 'QUESADILLA DE ASADA (2 PZS)',        'PAQ',    0.00, 35.00),
(145, 4, 'HOT DOG 02 PZAS',                    'PAQ',    0.00, 35.00),
(146, 4, 'SALCHIPAPAS',                        'PAQ',    0.00, 35.00),
(147, 4, 'ROLLITOS DE SALCHICHAS',             'PAQ',    0.00, 25.00),
(148, 4, 'SALBUTE DE PIERNA',                  'PIEZA',  0.00, 15.00),
(149, 4, 'SANDWICH PIERNA/ASADA',              'PIEZA',  0.00, 25.00),
(150, 4, 'EMPANADA QUESO/CARNE/POLLO/FRIJOL',  'PIEZA',  0.00, 12.00),
(151, 4, 'GRINGAS ASADA/PASTOR',               'PIEZA',  0.00, 25.00),
(152, 4, 'QUESABIRRIA',                        'PIEZA',  0.00, 25.00),
(153, 4, 'QUESIHAMBURGUESA',                   'PIEZA',  0.00, 25.00),
(154, 4, 'SALCHICHAS ENCHILADAS',              'PIEZA',  0.00, 30.00),
(155, 4, 'TACOS DE EMPANIZADO',                'PIEZA',  0.00, 15.00),
(156, 4, 'TACO DE PIBIL',                      'PIEZA',  0.00, 15.00),
(157, 4, 'SANDWICH DE POLLO',                  'PIEZA',  0.00, 25.00),
(158, 4, 'TACOS DE POLLO',                     'PIEZA',  0.00, 15.00),
(159, 4, 'SPAGUETTI',                          'PAQ',    0.00, 25.00),
(160, 4, 'ROLLITO DE SALCHICHA',               'PIEZA',  0.00, 10.00),
(161, 4, 'HAMBURGUESAS SIN PAPA',              'PIEZA',  0.00, 35.00),
(162, 4, 'HAMBURGUESAS CON PAPA',              'PIEZA',  0.00, 50.00),
(163, 4, 'NARANJAS 3 PZAS',                    'BOLSA',  0.00, 10.00),
(164, 4, 'GRINGAS ORDEN 02 PZAS',              'ORDEN',  0.00, 45.00),
(165, 4, 'BANDERILLAS',                        'ORDEN',  0.00, 25.00),
(166, 4, 'PAPAS',                              'ORDEN',  0.00, 30.00),
(167, 4, 'TOSTADA DE PIERNA',                  'ORDEN',  0.00, 35.00),
(168, 4, 'ROLLITO DE SALCHICHA 2 PZAS',        'ORDEN',  0.00, 25.00),
(169, 4, 'TAQUITOS DORADOS',                   'ORDEN',  0.00, 35.00),
(170, 4, 'ROLLITO DE SALCHICHA 3X10',          'ORDEN',  0.00, 30.00),
(171, 4, 'HOJALDRАС',                          'PIEZA',  0.00, 25.00),
(172, 4, 'CARNE POLACA',                       'ORDEN',  0.00, 30.00),
(173, 4, 'QUESADILLAS AL PASTOR/ASADA',        'ORDEN',  0.00, 40.00),
(174, 4, 'ENSALADA DE NOVIO',                  'ORDEN',  0.00, 30.00),
(175, 4, 'MEGAGRINGAS',                        'ORDEN',  0.00, 50.00);

# Inventario (productos representativos por sucursal)
insert into Inventario(cantidad, id_producto, id_sucursal)
values
-- Plantel 4
(50, 1, 1),(40, 2, 1),(30, 3, 1),(30, 4, 1),(30, 5, 1),
(20, 6, 1),(25, 7, 1),(20, 42, 1),(20, 43, 1),(15, 46, 1),
(15, 51, 1),(10, 52, 1),(30, 99, 1),(25, 100, 1),(20, 128, 1),
-- Plantel 6
(50, 1, 2),(40, 2, 2),(30, 3, 2),(30, 4, 2),(30, 5, 2),
(20, 6, 2),(25, 7, 2),(20, 42, 2),(20, 43, 2),(15, 46, 2),
(15, 51, 2),(10, 52, 2),(30, 99, 2),(25, 100, 2),(20, 128, 2),
-- Plantel 22
(50, 1, 3),(40, 2, 3),(30, 3, 3),(30, 4, 3),(30, 5, 3),
(20, 6, 3),(25, 7, 3),(20, 42, 3),(20, 43, 3),(15, 46, 3),
(15, 51, 3),(10, 52, 3),(30, 99, 3),(25, 100, 3),(20, 128, 3),
-- Plantel 26
(50, 1, 4),(40, 2, 4),(30, 3, 4),(30, 4, 4),(30, 5, 4),
(20, 6, 4),(25, 7, 4),(20, 42, 4),(20, 43, 4),(15, 46, 4),
(15, 51, 4),(10, 52, 4),(30, 99, 4),(25, 100, 4),(20, 128, 4),
-- Plantel 30
(50, 1, 5),(40, 2, 5),(30, 3, 5),(30, 4, 5),(30, 5, 5),
(20, 6, 5),(25, 7, 5),(20, 42, 5),(20, 43, 5),(15, 46, 5),
(15, 51, 5),(10, 52, 5),(30, 99, 5),(25, 100, 5),(20, 128, 5);

# Compra
insert into Compra(id_compra, fecha, id_empleado, id_sucursal, total)
values
(1,  '2025-01-05', 'SANL950101HMNRZR01', 1, 1250.00),
(2,  '2025-01-06', 'MARM960202MMNRTN02', 1,  980.00),
(3,  '2025-01-07', 'GUTR010606HMNRZR06', 2, 1100.00),
(4,  '2025-01-08', 'TORR020707MMNRZR07', 2,  870.00),
(5,  '2025-01-09', 'MORM061111MMNRZR11', 3, 1320.00),
(6,  '2025-01-10', 'ESPJ071212HMNRZR12', 3,  760.00),
(7,  '2025-01-11', 'ORTR111616HMNRZR16', 4, 1450.00),
(8,  '2025-01-12', 'MEDL121717MMNRZR17', 4,  920.00),
(9,  '2025-01-13', 'LEOA162121HMNRZR21', 5, 1180.00),
(10, '2025-01-14', 'JIMP172222MMNRZR22', 5,  840.00);

# Detalle_compra
insert into Detalle_compra(cantidad, id_producto, id_compra, precio_venta, subtotal)
values
-- Compra 1
(10, 1,  1, 2.46,   24.60),
(10, 2,  1, 4.09,   40.90),
(5,  6,  1, 16.37,  81.85),
(20, 42, 1, 5.00,  100.00),
(10, 46, 1, 10.50, 105.00),
-- Compra 2
(8,  3,  2, 10.00,  80.00),
(8,  4,  2, 10.00,  80.00),
(10, 51, 2, 3.95,   39.50),
(5,  52, 2, 14.23,  71.15),
-- Compra 3
(10, 1,  3, 2.46,   24.60),
(10, 7,  3, 9.80,   98.00),
(15, 43, 3, 7.00,  105.00),
(10, 53, 3, 6.55,   65.50),
-- Compra 4
(10, 2,  4, 4.09,   40.90),
(10, 5,  4, 10.00, 100.00),
(10, 55, 4, 6.55,   65.50),
-- Compra 5
(5,  99, 5, 210.00, 1050.00),
(10, 1,  5, 2.46,    24.60),
(10, 42, 5, 5.00,    50.00),
-- Compra 6
(10, 2,  6, 4.09,   40.90),
(10, 3,  6, 10.00, 100.00),
(10, 46, 6, 10.50, 105.00),
-- Compra 7
(5,  100, 7, 210.00, 1050.00),
(10, 1,   7, 2.46,    24.60),
(10, 52,  7, 14.23,  142.30),
-- Compra 8
(10, 2,  8, 4.09,   40.90),
(10, 7,  8, 9.80,   98.00),
(15, 44, 8, 5.00,   75.00),
-- Compra 9
(5,  99, 9, 210.00, 1050.00),
(10, 6,  9, 16.37,  163.70),
(10, 43, 9, 7.00,    70.00),
-- Compra 10
(10, 1,  10, 2.46,   24.60),
(10, 4,  10, 10.00, 100.00),
(10, 51, 10, 3.95,   39.50);

# Venta
insert into Venta(id_venta, fecha, id_empleado, id_sucursal, total)
values
(1,  '2025-01-05', 'SANL950101HMNRZR01', 1,  245.00),
(2,  '2025-01-05', 'MARM960202MMNRTN02', 1,  310.00),
(3,  '2025-01-06', 'GUTR010606HMNRZR06', 2,  180.00),
(4,  '2025-01-06', 'TORR020707MMNRZR07', 2,  420.00),
(5,  '2025-01-07', 'MORM061111MMNRZR11', 3,  275.00),
(6,  '2025-01-07', 'ESPJ071212HMNRZR12', 3,  390.00),
(7,  '2025-01-08', 'ORTR111616HMNRZR16', 4,  215.00),
(8,  '2025-01-08', 'MEDL121717MMNRZR17', 4,  460.00),
(9,  '2025-01-09', 'LEOA162121HMNRZR21', 5,  330.00),
(10, '2025-01-09', 'JIMP172222MMNRZR22', 5,  285.00);

# Detalle_venta
insert into Detalle_venta(cantidad, id_producto, id_venta, precio_venta, subtotal)
values
-- Venta 1
(3, 1,  1, 11.00,  33.00),
(2, 3,  1, 20.00,  40.00),
(2, 42, 1, 10.00,  20.00),
(3, 99, 1, 15.00,  45.00),
(2, 128,1, 30.00,  60.00),
-- Venta 2
(4, 2,  2, 16.00,  64.00),
(3, 5,  2, 20.00,  60.00),
(5, 46, 2, 15.00,  75.00),
(3, 51, 2, 10.00,  30.00),
-- Venta 3
(2, 1,  3, 11.00,  22.00),
(2, 7,  3, 16.00,  32.00),
(3, 43, 3, 15.00,  45.00),
(3, 52, 3, 25.00,  75.00),
-- Venta 4
(5, 2,  4, 16.00,  80.00),
(4, 4,  4, 20.00,  80.00),
(2, 128,4, 30.00,  60.00),
(4, 100,4, 15.00,  60.00),
-- Venta 5
(3, 1,  5, 11.00,  33.00),
(2, 6,  5, 26.00,  52.00),
(3, 99, 5, 15.00,  45.00),
(3, 46, 5, 15.00,  45.00),
-- Venta 6
(4, 2,  6, 16.00,  64.00),
(3, 3,  6, 20.00,  60.00),
(2, 52, 6, 25.00,  50.00),
(3, 128,6, 30.00,  90.00),
-- Venta 7
(2, 1,  7, 11.00,  22.00),
(3, 5,  7, 20.00,  60.00),
(3, 42, 7, 10.00,  30.00),
(3, 99, 7, 15.00,  45.00),
-- Venta 8
(5, 2,  8, 16.00,  80.00),
(4, 4,  8, 20.00,  80.00),
(3, 100,8, 15.00,  45.00),
(3, 130,8, 30.00,  90.00),
-- Venta 9
(3, 1,  9, 11.00,  33.00),
(2, 6,  9, 26.00,  52.00),
(3, 43, 9, 15.00,  45.00),
(4, 128,9, 30.00, 120.00),
-- Venta 10
(2, 2,  10, 16.00,  32.00),
(3, 3,  10, 20.00,  60.00),
(3, 51, 10, 10.00,  30.00),
(3, 99, 10, 15.00,  45.00);
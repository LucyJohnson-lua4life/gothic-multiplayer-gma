local world_items_module = {}

-- item_spots[i] = {x-coordinate,y-corrdiante,z-coordinate}
local item_spots ={}

-- city1 forrest
item_spots[1] = {7174,337,-7304}
item_spots[2] = {7302.8227539063, 342.0705871582, -7406.0981445313}
item_spots[3] = {7294.8408203125, 348.28213500977, -7590.2377929688}
item_spots[4] = {6507.6459960938, 605.5849609375, -9223.984375}
item_spots[5] = {6652.4375, 606.32507324219, -9128.873046875}
item_spots[6] = {2363.7426757813, 113.7184677124, -10644.41796875}
item_spots[7] = {2180.0517578125, 55.812355041504, -10784.423828125}
item_spots[8] = {4910.21875, 368.87945556641, -14648.051757813}
item_spots[9] = {4701.7416992188, 402.51104736328, -14691.974609375}
item_spots[10] = {4619.08203125, 411.13873291016, -14842.215820313}
item_spots[11] = {3468.0498046875, 632.76202392578, -18221.818359375}
item_spots[12] = {3238.4899902344, 671.19543457031, -18368.955078125}
item_spots[13] = {2649.8469238281, 733.66687011719, -19415.099609375}
item_spots[14] = {2587.7895507813, 768.8330078125, -19184.232421875}
item_spots[15] = {2817.6845703125, 806.38317871094, -19082.416015625}
item_spots[16] = {6314.818359375, 407.5104675293, -22314.958984375}
item_spots[17] = {6386.6650390625, 407.48431396484, -22039.93359375}
item_spots[18] = {6542.4404296875, 393.15478515625, -22317.15625}
item_spots[19] = {-1478.5302734375, 246.85420227051, -19265.6875}
item_spots[20] = {-1493.8723144531, 246.75038146973, -18997.80859375}
item_spots[21] = {-3122.6091308594, 681.91583251953, -11768.307617188}
item_spots[22] = {-3227.7658691406, 678.01879882813, -11955.6015625}

-- stonehedge farm1
item_spots[23] = {16290.51953125, 2651.2014160156, -9660.7294921875}
item_spots[24] = {16638.77734375, 2673.2397460938, -9918.2900390625}
item_spots[25] = {16456.1484375, 2746.6196289063, -8414.2197265625}
item_spots[26] = {16946.380859375, 2750.0456542969, -8577.2431640625}
item_spots[27] = {17234.845703125, 2666.6743164063, -9013.3134765625}

-- xardas forrest
item_spots[28] = {28119.34375, 511.76956176758, -15736.9375}
item_spots[29] = {27994.09765625, 513.0087890625, -15542.697265625}
item_spots[30] = {27985.6953125, 512.97241210938, -15873.79296875}
item_spots[31] = {27281.583984375, 659.82934570313, -14321.354492188}
item_spots[32] = {27193.677734375, 735.84515380859, -14000.864257813}
item_spots[33] = {26873.72265625, 629.44287109375, -14246.752929688}
item_spots[34] = {25190.2109375, 796.60711669922, -13452.578125}
item_spots[35] = {24979.44140625, 838.21148681641, -13358.665039063}
item_spots[36] = {25327.556640625, 722.61389160156, -13754.631835938}
item_spots[37] = {26500.845703125, 501.87435913086, -16369.709960938}
item_spots[38] = {26328.49609375, 506.45440673828, -16353.921875}
item_spots[39] = {28105.71875, 612.01013183594, -17171.88671875}
item_spots[40] = {28285.294921875, 631.29699707031, -17253.99609375}
item_spots[41] = {29131.921875, 738.28039550781, -14678.966796875}
item_spots[42] = {28855.509765625, 694.34008789063, -14784.879882813}

-- city forrest 2
item_spots[43] = {5446.5693359375, 246.00297546387, 10978.345703125}
item_spots[44] = {5311.8564453125, 143.72863769531, 11433.392578125}
item_spots[45] = {5412.4692382813, 175.54168701172, 11270.227539063}
item_spots[46] = {3299.1301269531, 113.73711395264, 10407.487304688}
item_spots[47] = {3400.490234375, 134.46426391602, 10075.638671875}
item_spots[48] = {3420.5087890625, 219.39170837402, 11566.875976563}
item_spots[49] = {3610.7749023438, 260.5576171875, 11834.744140625}
item_spots[50] = {3360.974609375, 257.7926940918, 11976.607421875}

-- warg forrest
item_spots[51] = {6659.4477539063, 2398.6796875, 19304.576171875}
item_spots[52] = {6863.7587890625, 2422.4396972656, 19587.419921875}
item_spots[53] = {6603.86328125, 2468.95703125, 19817.064453125}
item_spots[54] = {7118.4521484375, 2415.9907226563, 18669.84375}
item_spots[55] = {6837.8984375, 2423.7478027344, 18655.091796875}
item_spots[56] = {7871.8256835938, 3961.1403808594, 22519.013671875}
item_spots[57] = {8232.427734375, 4025.4650878906, 22625.974609375}
item_spots[58] = {8033.3657226563, 3981.1975097656, 22942.37890625}
item_spots[59] = {10342.573242188, 3362.8874511719, 23155.8984375}
item_spots[60] = {10727.41015625, 3346.98046875, 23223.484375}
item_spots[61] = {10721.215820313, 2748.2141113281, 25501.92578125}
item_spots[62] = {10854.80859375, 2666.5720214844, 25924.9296875}
item_spots[63] = {12900.887695313, 3885.5192871094, 24466.869140625}
item_spots[64] = {13151.125976563, 4006.4616699219, 24139.296875}
item_spots[65] = {11174.263671875, 3446.4890136719, 17909.58984375}
item_spots[66] = {11323.510742188, 3553.1003417969, 17526.47265625}
item_spots[67] = {8296.33984375, 3468.0419921875, 15427.8515625}
item_spots[68] = {7996.5864257813, 3477.5385742188, 15769.239257813}
item_spots[69] = {13684.962890625, 3124.56640625, 15489.096679688}
item_spots[70] = {14017.091796875, 3117.4736328125, 15573.5}
item_spots[71] = {15327.379882813, 3644.3308105469, 17602.552734375}
item_spots[72] = {15008.920898438, 3799.4113769531, 17447.05078125}
item_spots[73] = {16143.702148438, 4179.5595703125, 19508.708984375}
item_spots[74] = {16421.087890625, 4089.7175292969, 19545.001953125}
item_spots[75] = {15842.24609375, 4340.3251953125, 20305.421875}
item_spots[76] = {15951.420898438, 4316.642578125, 20586.857421875}
item_spots[77] = {17584.9921875, 3841.6020507813, 20991.681640625}
item_spots[78] = {17711.658203125, 3784.9460449219, 21388.37109375}
item_spots[79] = {20147.77734375, 2618.8078613281, 23703.478515625}
item_spots[80] = {20431.888671875, 2698.2512207031, 23613.654296875}
item_spots[81] = {29908.1328125, 2651.9892578125, 18218.443359375}
item_spots[82] = {29987.90234375, 2672.513671875, 18451.4609375}
item_spots[83] = {30504.43359375, 3120.587890625, 21967.744140625}
item_spots[84] = {30469.455078125, 3114.5024414063, 21932.962890625}
item_spots[85] = {29047.171875, 4457.96484375, 24727.75}
item_spots[86] = {28802.72265625, 4424.6596679688, 24826.3203125}
item_spots[87] = {28818.197265625, 4480.3466796875, 25359.931640625}
item_spots[88] = {29408.21875, 4504.728515625, 25503.794921875}
item_spots[89] = {29678.927734375, 4460.8310546875, 24951.095703125}
item_spots[90] = {29729.28125, 4486.9189453125, 25298.2109375}
item_spots[91] = {29313.322265625, 4120.2880859375, 27625.74609375}
item_spots[92] = {29420.185546875, 4224.7729492188, 27247.240234375}
item_spots[93] = {25332.478515625, 3119.4826660156, 28733.44140625}
item_spots[94] = {25150.240234375, 3069.3188476563, 29029.544921875}
item_spots[95] = {21979.974609375, 2765.6879882813, 28336.2265625}
item_spots[96] = {21537.494140625, 2657.5979003906, 28276.2890625}

-- graveyard warg forrest 

item_spots[97] = {13507.393554688, 2751.1408691406, 14339.083007813}
item_spots[98] = {13329.564453125, 2948.0219726563, 14813.940429688}
item_spots[99] = {13543.71875, 2852.3735351563, 14649.451171875}

--sonnenkreis
item_spots[100] = {38782.4765625, 6765.8041992188, 28563.859375}
item_spots[101] = {38461.0078125, 6708.4965820313, 28741.484375}
item_spots[102] = {39613.12109375, 6815.3056640625, 29643.1328125}
item_spots[103] = {39340.39453125, 6874.2998046875, 29697.841796875}
item_spots[104] = {39623.16796875, 6916.6162109375, 30874.900390625}
item_spots[105] = {39348.42578125, 6954.6772460938, 31120.58203125}
item_spots[106] = {40241.28125, 6954.560546875, 31807.35546875}
item_spots[107] = {40375.4453125, 7001.1684570313, 32045.12890625}
item_spots[108] = {39962.37109375, 6959.6791992188, 33280.8046875}
item_spots[109] = {39681.34765625, 6948.30078125, 33506.828125}
item_spots[110] = {38657.078125, 6968.8647460938, 33502.19140625}
item_spots[111] = {38307.8359375, 6962.3774414063, 33584.6953125}
item_spots[112] = {38437.28515625, 6977.4248046875, 33675.8203125}
item_spots[113] = {36895.234375, 6936.685546875, 33676.90234375}
item_spots[114] = {37053.01953125, 6934.8969726563, 33735.97265625}
item_spots[115] = {36864.09375, 7126.7368164063, 32773.4296875}
item_spots[116] = {37569.8515625, 7128.1040039063, 32806.16015625}
item_spots[117] = {37854.7265625, 7119.2392578125, 32018.421875}
item_spots[118] = {37228.68359375, 7082.7905273438, 32039.005859375}
item_spots[119] = {37332.30859375, 7078.6728515625, 32370.474609375}
item_spots[120] = {36661.73828125, 7118.2685546875, 32042.74609375}
item_spots[121] = {35596.30078125, 6974.3525390625, 33574.984375}
item_spots[122] = {35445.140625, 6980.6889648438, 33637.01171875}
item_spots[123] = {34137.53125, 6801.91796875, 33263.6796875}
item_spots[124] = {33921.66796875, 6768.169921875, 33287.47265625}
item_spots[125] = {40802.59765625, 6821.966796875, 30532.240234375}
item_spots[126] = {40942.734375, 6770.6303710938, 30384.076171875}
item_spots[127] = {41073.8359375, 6788.5454101563, 30473.978515625}
item_spots[128] = {42451.74609375, 7045.7744140625, 30144.7734375}
item_spots[129] = {42607.83984375, 7200.6567382813, 29937.25390625}
item_spots[130] = {43745.921875, 7570.40625, 30985.08203125}
item_spots[131] = {43969.8203125, 7687.4736328125, 31034.841796875}
item_spots[132] = {43884.95703125, 7687.0297851563, 31317.853515625}
item_spots[133] = {45909.09765625, 7858.5263671875, 30867.9609375}
item_spots[134] = {45843.46484375, 7863.9741210938, 31043.927734375}
item_spots[135] = {46725.703125, 7864.650390625, 31461.671875}
item_spots[136] = {46653.109375, 7869.7622070313, 31648.095703125}
item_spots[137] = {46756.7578125, 7872.4682617188, 31859.548828125}
-- special grave at sonnenkreis
item_spots[138] = {46695.94140625, 7855.2216796875, 35468.421875}

-- at big lake
item_spots[139] = {56718.44921875, 6836.5966796875, 29999.8828125}
item_spots[140] = {56980.83203125, 6838.4306640625, 30127.447265625}
item_spots[141] = {57339.37890625, 6904.5922851563, 29784.654296875}
item_spots[142] = {57429.83984375, 6925.095703125, 29661.662109375}
item_spots[143] = {59794.171875, 6974.310546875, 29061.337890625}
item_spots[144] = {60092.80859375, 6975.1567382813, 28884.4140625}
item_spots[145] = {60960.62109375, 6884.6181640625, 29606.556640625}
item_spots[146] = {61210.69140625, 6919.7548828125, 29437.02734375}
item_spots[147] = {61414.05078125, 6794.4233398438, 30944.330078125}
item_spots[148] = {61403.54296875, 6780.2548828125, 31118.552734375}
item_spots[149] = {61522.47265625, 6776.5063476563, 31156.1015625}
item_spots[150] = {63711.75, 6987, 34421.56640625}
item_spots[151] = {63969.703125, 7041.076171875, 34371.21484375}
item_spots[152] = {64583.5078125, 7230.0551757813, 35333.125}
item_spots[153] = {64621.90234375, 7220.412109375, 35497.95703125}
item_spots[154] = {64768.1015625, 7154.2592773438, 36551.94140625}
item_spots[155] = {64989.28515625, 7155.0859375, 36681.890625}
item_spots[156] = {64680.15234375, 7122.2885742188, 36792.2578125}
item_spots[157] = {63588.26953125, 7063.427734375, 37362.75}
item_spots[158] = {63366.64453125, 7076.8916015625, 37371.08984375}
item_spots[159] = {61712.265625, 7200.0727539063, 38709.1328125}
item_spots[160] = {61613.44921875, 7197.3520507813, 38825.41796875}
item_spots[161] = {60503.87109375, 7079.650390625, 39367.37890625}
item_spots[162] = {60426.28515625, 7055.7666015625, 39239.32421875}
item_spots[163] = {59954.7109375, 6761.6069335938, 42800.95703125}
item_spots[164] = {60183.48828125, 6730.2797851563, 42870.6328125}
item_spots[165] = {59496.8828125, 6932.0546875, 40568.30859375}
item_spots[166] = {59616.34375, 6933.4868164063, 40661.015625}
item_spots[167] = {68464.140625, 6717.4389648438, 34211}
item_spots[168] = {68635.0234375, 6679.0073242188, 34312.19140625}
item_spots[169] = {72079.4140625, 7015.3432617188, 33330.16015625}
item_spots[170] = {72187.1015625, 7019.7416992188, 33309.5078125}
-- maya temple
item_spots[171] = {74771.6328125, 5153.1411132813, 22876.923828125}
item_spots[172] = {74928.78125, 5147.1865234375, 23074.994140625}
item_spots[173] = {74602.2578125, 5160.4965820313, 22958.568359375}
item_spots[174] = {77615.4296875, 5166.6684570313, 29134.744140625}
item_spots[175] = {77460.96875, 5170.2641601563, 29393.474609375}
item_spots[176] = {79369.96875, 5320.740234375, 28355.912109375}
item_spots[177] = {79300.796875, 5284.291015625, 28162.640625}
item_spots[178] = {79032.59375, 5332.8876953125, 29132.267578125}
item_spots[179] = {78977.5703125, 5328.3471679688, 29344.3515625}
item_spots[180] = {78165.0078125, 5278.259765625, 30843.998046875}
item_spots[181] = {78275.8984375, 5304.9506835938, 30975.833984375}
item_spots[182] = {66892.0625, 5106.873046875, 26758.6875}
item_spots[183] = {67067.75, 5076.5, 26545.765625}

-- around big bridge

item_spots[184] = {70867.5859375, 4326.8188476563, 15250.296875}
item_spots[185] = {70857.84375, 4356.2768554688, 15110.243164063}
item_spots[186] = {61636.31640625, 3440.4274902344, 15457.04296875}
item_spots[187] = {61809.03515625, 3383.0546875, 15631.352539063}
item_spots[188] = {61644.01171875, 3337.6616210938, 16258.698242188}
item_spots[189] = {63097.07421875, 3278.0395507813, 16733.38671875}
item_spots[190] = {63448.4375, 3280.7580566406, 16847.40625}
item_spots[191] = {64096.30859375, 3259.1247558594, 17313.115234375}
item_spots[192] = {64251.1640625, 3267.1296386719, 17760.12890625}
item_spots[193] = {64950.33984375, 3252.3703613281, 18736.287109375}
item_spots[194] = {46034.265625, 3490.7919921875, 6853.458984375}
item_spots[195] = {46040.67578125, 3414.3894042969, 7156.1328125}
item_spots[196] = {48777.3125, 3332.5981445313, 9341.6533203125}
item_spots[197] = {48975.15234375, 3370.2907714844, 9656.662109375}
item_spots[198] = {55843.30859375, 3595.421875, 12833.581054688}
item_spots[199] = {55554.08984375, 3575.5161132813, 12773.763671875}

-- bigfarm lake
item_spots[200] = {46637.3046875, 1560.984375, -6900.9633789063}
item_spots[201] = {47268.6875, 1559.1732177734, -6935.017578125}
item_spots[202] = {48017.765625, 1579.1685791016, -6739.0537109375}
item_spots[203] = {48920.453125, 1526.5638427734, -6802.25}
item_spots[204] = {49969.0390625, 1515.4226074219, -7516.8276367188}
item_spots[205] = {51549.296875, 1535.4151611328, -8811.4765625}
item_spots[206] = {51857.5625, 1537.3802490234, -9961.9482421875}
item_spots[207] = {51429.7578125, 1549.3928222656, -11500.112304688}
item_spots[208] = {48155.91796875, 1647.3458251953, -10643.197265625}
item_spots[209] = {48012.17578125, 1724.1977539063, -10277.814453125}
item_spots[210] = {47621.79296875, 1694.7406005859, -10536.890625}

--bigfarrm forrest
item_spots[211] = {53741.30078125, 1678.8192138672, 652.90753173828}
item_spots[212] = {53870.0703125, 1685.2233886719, 896.89270019531}
item_spots[213] = {55126.34375, 1719.5747070313, 2856.3798828125}
item_spots[214] = {55496.1484375, 1709.138671875, 2767.1081542969}
item_spots[215] = {55544.83984375, 1705.2281494141, 3074.4885253906}
item_spots[216] = {55979.1015625, 1692.0657958984, 4846.697265625}
item_spots[217] = {56066.2734375, 1698.8502197266, 4953.5102539063}
item_spots[218] = {57035.0390625, 1862.0808105469, 5911.5126953125}
item_spots[219] = {57257.3515625, 1911.5341796875, 5817.513671875}
item_spots[220] = {57288.3125, 1921.7224121094, 5718.0263671875}
item_spots[221] = {56935.6015625, 1808.0532226563, 7171.3549804688}
item_spots[222] = {57037.82421875, 1814.2115478516, 7467.44140625}
item_spots[223] = {57897.57421875, 1966.0765380859, 6863.4326171875}
item_spots[224] = {57904.01171875, 1974.0833740234, 6586.951171875}
item_spots[225] = {61138.20703125, 2143.8159179688, 7161.9897460938}
item_spots[226] = {61357.0078125, 2103.9169921875, 7273.1450195313}
item_spots[227] = {61210.875, 2202.1887207031, 6335.2861328125}
item_spots[228] = {61109.66796875, 2206.2258300781, 6121.1596679688}
item_spots[229] = {61433.74609375, 2221.6362304688, 6281.87109375}
item_spots[230] = {62535.453125, 2336.0554199219, 4599.1259765625}
item_spots[231] = {62782.83203125, 2324.3601074219, 4754.0244140625}
item_spots[232] = {62886.91015625, 2368.6535644531, 4517.6713867188}
item_spots[233] = {63618.2890625, 2441.4975585938, 3240.7043457031}
item_spots[234] = {63728.953125, 2446.9846191406, 2998.8522949219}
item_spots[235] = {64950.453125, 2219.0861816406, 510.04370117188}
item_spots[236] = {65063.4765625, 2194.1936035156, 165.10313415527}
item_spots[237] = {66145.078125, 2287.515625, 646.63879394531}
item_spots[238] = {66202.0390625, 2292.2485351563, 497.85595703125}
item_spots[239] = {69955.40625, 2447.9887695313, 1980.1580810547}
item_spots[240] = {69833.7421875, 2431.1022949219, 1899.7242431641}
item_spots[241] = {72200.890625, 3039.033203125, 849.96374511719}
item_spots[242] = {72361.421875, 3113.7299804688, 673.99792480469}
item_spots[243] = {75097.9609375, 3348.0578613281, -2819.9499511719}
item_spots[244] = {75261.5703125, 3342.4291992188, -2805.7602539063}
item_spots[245] = {76332.640625, 3501.6398925781, -3744.4426269531}
item_spots[246] = {76521.6171875, 3550.3601074219, -4062.0803222656}
item_spots[247] = {79414.5625, 3881.2600097656, -5334.5986328125}
item_spots[248] = {79820.5390625, 3900.060546875, -5383.802734375}
item_spots[249] = {81326.9296875, 4060.9208984375, -6934.2094726563}
item_spots[250] = {81664.828125, 4108.9150390625, -6936.4624023438}
item_spots[251] = {82612.4609375, 4243.7431640625, -7333.3120117188}
item_spots[252] = {82383.953125, 4220.5302734375, -7201.4438476563}
item_spots[253] = {83845.5, 4643.1801757813, -9183.8525390625}
item_spots[254] = {83917.65625, 4682.0209960938, -9376.7392578125}
item_spots[255] = {82719.921875, 4518.5297851563, -10613.94140625}
item_spots[256] = {82705.3515625, 4538.7377929688, -10830.541015625}
item_spots[257] = {83697.296875, 4344.2143554688, -16829.044921875}
item_spots[258] = {83670.4296875, 4328.4672851563, -17074.251953125}
item_spots[259] = {83321.9609375, 4326.0678710938, -17043.0078125}
item_spots[260] = {79207.8203125, 4078.279296875, -20359.44140625}
item_spots[261] = {79425.21875, 4072.4763183594, -20478.265625}
item_spots[262] = {73157.9609375, 2570.7202148438, -21630.189453125}
item_spots[263] = {72947.9453125, 2489.7888183594, -21789.037109375}

--troll forrest
item_spots[264] = {68265.546875, 1627.6527099609, -25472.826171875}
item_spots[265] = {68278.1484375, 1607.7010498047, -25694.8046875}
item_spots[266] = {67284.1171875, 1563.6940917969, -30568.4375}
item_spots[267] = {67360.6796875, 1573.2122802734, -30768.115234375}
item_spots[268] = {67171.84375, 1562.3572998047, -31044.125}
item_spots[269] = {65362.8203125, 1521.9251708984, -31763.666015625}
item_spots[270] = {65830.125, 1514.5006103516, -30808.66796875}

--farm 3 forrest
item_spots[271] = {47712.1015625, 2419.3024902344, -30073.595703125}
item_spots[272] = {47920.34375, 2422.6267089844, -29797.3515625}
item_spots[273] = {46473.78515625, 2540.6130371094, -32563.716796875}
item_spots[274] = {46755.8984375, 2516.8032226563, -32453.916015625}
item_spots[275] = {46119.74609375, 2621.4677734375, -31276.5}
item_spots[276] = {45751.9765625, 2758.294921875, -29956.451171875}
item_spots[277] = {45723.01953125, 2779.1708984375, -29806.080078125}

-- plateu water
item_spots[278] = {43812.55078125, 2941.4514160156, -25134.18359375}
item_spots[279] = {44460.98046875, 2969.7883300781, -25869.556640625}
item_spots[280] = {44279.578125, 2955.970703125, -26678.115234375}
item_spots[281] = {41705.36328125, 2965.015625, -24561.953125}
item_spots[282] = {40929.44140625, 2948.5031738281, -24554.912109375}
item_spots[283] = {43101.63671875, 2707.2192382813, -17101.5234375}
item_spots[284] = {45532.109375, 2616.4880371094, -16070.21875}
item_spots[285] = {46053.71875, 2601.6298828125, -15721.798828125}
item_spots[286] = {46519.046875, 2594.1672363281, -15193.473632813}
item_spots[287] = {45581.98046875, 2573.9533691406, -15228.583007813}
item_spots[288] = {44880.640625, 2658.4545898438, -15585.404296875}
item_spots[289] = {44912.8828125, 2612.361328125, -14610.7109375}

-- forrest close to city2
item_spots[290] = {22399.74609375, -336.82989501953, -1812.88671875}
item_spots[291] = {22741.951171875, -377.90844726563, -1590.9400634766}
item_spots[292] = {24577.271484375, -364.77865600586, -1406.4659423828}
item_spots[293] = {24480.240234375, -352.11987304688, -1475.4981689453}
item_spots[294] = {25077.02734375, -398.60498046875, -1606.7711181641}
item_spots[295] = {24947.845703125, -363.34072875977, -1555.9166259766}
item_spots[296] = {24984.201171875, -433.71936035156, -1125.3461914063}
item_spots[297] = {25200.53125, -468.35775756836, -1179.4337158203}
item_spots[298] = {25339.697265625, -665.87713623047, 94.115348815918}
item_spots[299] = {25673.2890625, -678.45062255859, 89.788146972656}
item_spots[300] = {25359.271484375, -786.19592285156, 428.81756591797}
item_spots[301] = {29347.81640625, -1748.2797851563, -1072.8529052734}
item_spots[302] = {29482.578125, -1777.6850585938, -1148.1572265625}



local empty_item_spots = {}


local regular_plants = {"ItPl_Health_Herb_01", "ItPl_Mana_Herb_01"}

local deep_forrest_plants = {"ItPl_Health_Herb_01", "ItPl_Mana_Herb_01", "ItPl_Health_Herb_01", 
"ItPl_Mana_Herb_01", "ItPl_Forestberry", "ItPl_Blueplant", "Heilwurzel", "Feuerwurzel"}

local water_plants = {"ItPl_Health_Herb_01", "Blauflieder", "ItPl_SwampHerb"}

local magic_place_plants = {"Heilwurzel", "Feuerwurzel", "Kronstöckel"}

local itemId_to_placeId = {}



local function spawnPlantBasedOnLocation(index)
    local itemName = nil
    if index >= 28 and index <= 42 then
        itemName = deep_forrest_plants[math.random(1,8)]
    elseif index >= 51 and index <= 96 then
        itemName = deep_forrest_plants[math.random(1,8)]
    elseif index >= 211 and index <= 263 then
        itemName = deep_forrest_plants[math.random(1,8)]
    elseif index >= 100 and index <= 137 then
        itemName = deep_forrest_plants[math.random(1,8)]
    elseif index >= 139 and index <= 70 then
        itemName = water_plants[math.random(1,3)]
    elseif index >= 200 and index <= 210 then
        itemName = water_plants[math.random(1,3)]
    elseif index >= 278 and index <= 289 then
        itemName = water_plants[math.random(1,3)]
    elseif index >= 97 and index <= 99 then  
        itemName = magic_place_plants[math.random(1,3)]
    elseif index == 138 then
        itemName = magic_place_plants[math.random(1,3)]
    else
        itemName = regular_plants[math.random(1,2)]
    end

    local itemId = CreateItem(itemName, 1, item_spots[index][1], item_spots[index][2], item_spots[index][3], "NEWWORLD\\NEWWORLD.ZEN")
    itemId_to_placeId[itemId] = index
end

function RespawnPlants()
    for key, value in pairs(empty_item_spots) do
        empty_item_spots[key] = nil
        spawnPlantBasedOnLocation(value)
        SendMessageToAll(39, 199, 130, "size: " .. table.getn(empty_item_spots))
    end

end


function world_items_module.OnGamemodeInit()
  --  local itemid = CreateItem("ItPl_Health_Herb_01", 1, item_spots[1][1], item_spots[1][2], item_spots[1][3], "NEWWORLD\\NEWWORLD.ZEN")
    for i = 1,302,1 
        do 
            spawnPlantBasedOnLocation(i)
    end
    Plant_Respawn_Timer_Id = SetTimer("RespawnPlants", 10000, 1);
end

function world_items_module.OnPlayerTakeItem(playerid, itemID, itemInstance, amount, x, y, z, worldName)
    if itemID >= 0 and itemId_to_placeId[itemID] ~= nil then
        table.insert(empty_item_spots, itemId_to_placeId[itemID])
        itemId_to_placeId[itemID] = nil
    end
end




return world_items_module
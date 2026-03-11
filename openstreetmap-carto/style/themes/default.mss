/* From addressing.mss */
@address-color: #666;
@building-text-color: #444;

/* From admin.mss */
@admin-boundaries: #8d618b; // Lch(47,30,327)
@admin-boundaries-narrow: #845283; // Lch(42,35,327)
@admin-boundaries-wide: #a37da1; // Lch(57,25,327)

/* From amenity-points.mss */
@marina-text: #576ddf; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for mud */
@shop-icon: #ac39ac;
@shop-text: #939;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@accommodation-icon: @transportation-icon;
@accommodation-text: @transportation-text;
@airtransport: #8461C4; //also ferry_terminal
@health-color: #BF0000;
@amenity-brown: #734a08;
@gastronomy-icon: #C77400;
@gastronomy-text: darken(@gastronomy-icon, 5%);
@memorials: @amenity-brown;
@culture: @amenity-brown;
@public-service: @amenity-brown;
@office: #4863A0;
@man-made-icon: #666666;
@advertising-grey: @man-made-icon;
@barrier-icon: #3f3f3f;
@landform-color: #d08f55;
@leisure-green: darken(@park, 60%);
@protected-area: #008000;
@aboriginal: #82643a;
@religious-icon: #000000;
@traffic-signals-icon: #545454;
@volcano-icon: #d40000;
@spring-icon: #7abcec;
@level-crossing-icon: #4d4d4d;
@bollard-icon: #7d7c7c;
@place-of-worship-text: #000033;
@marketplace-text-halo: rgba(255, 255, 255, 0.6);
@volcano-text: #d40000;
@island-text: #000;
@cape-text: #000;
@tree-text: green;
@tree-trunk-fill: #6b8d5e;
@tourism-information-text: darken(black, 30%);
@man-made-text: darken(@man-made-icon, 20%);

@landcover-font-size: 10;
@landcover-wrap-width-size: 30; // 3 em
@landcover-line-spacing-size: -1.5; // -0.15 em
@landcover-font-size-big: 12;
@landcover-wrap-width-size-big: 36; // 3 em
@landcover-line-spacing-size-big: -1.8; // -0.15 em
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size-bigger: 45; // 3 em
@landcover-line-spacing-size-bigger: -2.25; // -0.15 em
@landcover-face-name: @oblique-fonts;
@standard-font-size: 10;
@standard-wrap-width: 30; // 3 em
@standard-line-spacing-size: -1.5; // -0.15 em
@standard-font: @book-fonts;
@private-opacity: 0.33;

/* From buildings.mss */
@building-fill: #d9d0c9;  // Lch(84, 5, 68)
@building-line: darken(@building-fill, 15%);  // Lch(70, 9, 66)
@building-low-zoom: darken(@building-fill, 4%);
@building-major-fill: darken(@building-fill, 10%);  // Lch(75, 8, 67)
@building-major-line: darken(@building-major-fill, 15%);  // Lch(61, 13, 65)
@building-major-z15: darken(@building-major-fill, 5%);  // Lch(70, 9, 66)
@building-major-z14: darken(@building-major-fill, 10%);  // Lch(66, 11, 65)
@entrance-permissive: darken(@building-line, 15%);
@entrance-normal: @building-line;
@building-bridge-fill: #B8B8B8;

/* From ferry-routes.mss */
@ferry-route: #66f;
@ferry-route-text: @ferry-route;
@ferry-route-casing: #999;

/* From fonts.mss */
@book-fonts:    "Noto Sans Regular",
                "Noto Sans Adlam Unjoined Regular",
                "Noto Sans Arabic UI Regular",
                "Noto Sans Armenian Regular",
                "Noto Sans Balinese Regular",
                "Noto Sans Bamum Regular",
                "Noto Sans Batak Regular",
                "Noto Sans Bengali UI Regular",
                "Noto Sans Buginese Regular",
                "Noto Sans Buhid Regular",
                "Noto Sans Canadian Aboriginal Regular",
                "Noto Sans Chakma Regular",
                "Noto Sans Cham Regular",
                "Noto Sans Cherokee Regular",
                "Noto Sans Coptic Regular",
                "Noto Sans Devanagari UI Regular",
                "Noto Sans Ethiopic Regular",
                "Noto Sans Georgian Regular",
                "Noto Sans Gujarati UI Regular",
                "Noto Sans Gurmukhi UI Regular",
                "Noto Sans Hanunoo Regular",
                "Noto Sans Hebrew Regular",
                "Noto Sans Javanese Regular",
                "Noto Sans Kannada UI Regular",
                "Noto Sans Kayah Li Regular",
                "Noto Sans Khmer UI Regular",
                "Noto Sans Lao UI Regular",
                "Noto Sans Lepcha Regular",
                "Noto Sans Limbu Regular",
                "Noto Sans Lisu Regular",
                "Noto Sans Malayalam UI Regular",
                "Noto Sans Mandaic Regular",
                "Noto Sans Mongolian Regular",
                "Noto Sans Myanmar UI Regular",
                "Noto Sans New Tai Lue Regular",
                "Noto Sans NKo Regular",
                "Noto Sans Ol Chiki Regular",
                "Noto Sans Oriya UI Regular",
                "Noto Sans Osage Regular",
                "Noto Sans Osmanya Regular",
                "Noto Sans Samaritan Regular",
                "Noto Sans Saurashtra Regular",
                "Noto Sans Shavian Regular",
                "Noto Sans Sinhala UI Regular",
                "Noto Sans Sundanese Regular",
                "Noto Sans Symbols Regular",
                "Noto Sans Symbols2 Regular",
                "Noto Sans Syriac Regular",
                "Noto Sans Tagalog Regular",
                "Noto Sans Tagbanwa Regular",
                "Noto Sans Tai Le Regular",
                "Noto Sans Tai Tham Regular",
                "Noto Sans Tai Viet Regular",
                "Noto Sans Tamil UI Regular",
                "Noto Sans Telugu UI Regular",
                "Noto Sans Thaana Regular",
                "Noto Sans Thai UI Regular",
                "Noto Sans Tifinagh Regular",
                "Noto Sans Vai Regular",
                "Noto Sans Yi Regular",
                "Noto Sans CJK JP Regular",
                
                "Noto Serif Tibetan Regular",
                "Noto Emoji Regular",

                "HanaMinA Regular", "HanaMinB Regular";
@bold-fonts:    "Noto Sans Bold",
                "Noto Sans Adlam Unjoined Bold",
                "Noto Sans Arabic UI Bold",
                "Noto Sans Armenian Bold",
                "Noto Sans Balinese Bold",
                "Noto Sans Bamum Bold",
                "Noto Sans Bengali UI Bold",
                "Noto Sans Canadian Aboriginal Bold",
                "Noto Sans Cham Bold",
                "Noto Sans Cherokee Bold",
                "Noto Sans Devanagari UI Bold",
                "Noto Sans Ethiopic Bold",
                "Noto Sans Georgian Bold",
                "Noto Sans Gujarati UI Bold",
                "Noto Sans Gurmukhi UI Bold",
                "Noto Sans Hebrew Bold",
                "Noto Sans Javanese Bold",
                "Noto Sans Kannada UI Bold",
                "Noto Sans Kayah Li Bold",
                "Noto Sans Khmer UI Bold",
                "Noto Sans Lao UI Bold",
                "Noto Sans Lisu Bold",
                "Noto Sans Malayalam UI Bold",
                "Noto Sans Myanmar Bold",
                "Noto Sans Ol Chiki Bold",
                "Noto Sans Oriya UI Bold",
                "Noto Sans Sinhala UI Bold",
                "Noto Sans Sundanese Bold",
                "Noto Sans Symbols Bold",
                "Noto Sans Syriac Black",
                "Noto Sans Tai Tham Bold",
                "Noto Sans Tamil UI Bold",
                "Noto Sans Telugu UI Bold",
                "Noto Sans Thaana Bold",
                "Noto Sans Thai UI Bold",
                "Noto Sans CJK JP Bold",

                "Noto Serif Tibetan Bold",
                "Noto Emoji Bold",

                @book-fonts;
@oblique-fonts: "Noto Sans Italic", @book-fonts;

/* From golf.mss */
@golf-color: #666;

/* From landcover.mss */
@grass: #cdebb0;        // Lch(90,32,128) also grassland, meadow, village_green, garden, allotments
@scrub: #c8d7ab;        // Lch(84,24,122)
@forest: #add19e;       // Lch(80,30,135)
@forest-text: #46673b;  // Lch(40,30,135)
@park: #c8facc;         // Lch(94,30,145)
@allotments: #c9e1bf;   // Lch(87,20,135)
@orchard: #aedfa3; // also vineyard, plant_nursery
@hedge: @forest;       // Lch(80,30,135)
@built-up-lowzoom: #d0d0d0;
@built-up-z12: #dddddd;
@residential: #e0dfdf;      // Lch(89,0,0)
@residential-line: #b9b9b9; // Lch(75,0,0)
@retail: #ffd6d1;           // Lch(89,16,30)
@retail-line: #d99c95;      // Lch(70,25,30)
@commercial: #f2dad9;       // Lch(89,8.5,25)
@commercial-line: #d1b2b0;  // Lch(75,12,25)
@industrial: #ebdbe8;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: #c6b3c3;  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)
@farmland: #eef0d5;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)
@landuse-faint-outline-width: 0.5; 
@transportation-area: #e9e7e2;
@apron: #dadae0;
@garages: #dfddce;
@parking: #eeeeee;
@parking-outline: saturate(darken(@parking, 40%), 20%);
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services
@bare_ground: #eee5dc;
@campsite: #def6c0; // also caravan_site, picnic_site
@cemetery: #aacbaf; // also grave_yard
@construction: #c7c7b4; // also brownfield
@heath: #d6d99f;
@mud: rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@place_of_worship: #d0d0d0; // also landuse_religious
@place_of_worship_outline: darken(@place_of_worship, 30%);
@leisure: lighten(@park, 5%);
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);
@sand: #f5e9c6;
@societal_amenities: #ffffe5;   // Lch(99,13,109)
@tourism: #660033;
@quarry: #c5c3c3;
@military: #f55;
@beach: #fff1ba;
@wastewater_plant: @industrial;
@wastewater_plant-line: @industrial-line;
@water_works: @industrial;
@water_works-line: @industrial-line;
@pitch: #88e0be;           // Lch(83,35,166) also track
@track: @pitch;
@stadium: @leisure; // also sports_centre
@golf_course: @campsite;

/* From placenames.mss */
@placenames: #222;
@placenames-light: #777777;
@country-labels: darken(@admin-boundaries-narrow, 10%);
@state-labels: desaturate(@admin-boundaries-narrow, 5%);
@county-labels: darken(@admin-boundaries-wide, 5%);

/* From power.mss */
@power-line-color: #888;

/* From road-colors-generated.mss */
@motorway-casing: #dc2a67;
@trunk-casing: #c84e2f;
@primary-casing: #a06b00;
@secondary-casing: #707d05;
@motorway-fill: #e892a2;
@trunk-fill: #f9b29c;
@primary-fill: #fcd6a4;
@secondary-fill: #f7fabf;
@motorway-low-zoom: #e66e89;
@trunk-low-zoom: #f6967a;
@primary-low-zoom: #f4c37d;
@secondary-low-zoom: #e7ed9d;
@motorway-low-zoom-casing: #c24e6b;
@trunk-low-zoom-casing: #d1684a;
@primary-low-zoom-casing: #c78d2b;
@secondary-low-zoom-casing: #a4b329;
@motorway-shield: #620728;
@trunk-shield: #5f1c0c;
@primary-shield: #503000;
@secondary-shield: #364000;

/* From roads.mss */
@tertiary-fill: #ffffff;
@residential-fill: #ffffff;
@service-fill: @residential-fill;
@living-street-fill: #ededed;
@pedestrian-fill: #dddde8;
@raceway-fill: #ffc0cb;
@road-fill: #ddd;
@footway-fill: salmon;
@footway-fill-noaccess: #bbbbbb;
@steps-fill: @footway-fill;
@steps-fill-noaccess: #bbbbbb;
@cycleway-fill: blue;
@cycleway-fill-noaccess: #9999ff;
@bridleway-fill: green;
@bridleway-fill-noaccess: #aaddaa;
@track-fill: #996600;
@track-fill-noaccess: #e2c5bb;
@platform-fill: #bbbbbb;
@platform-casing: grey;
@aeroway-fill: #bbc;
@runway-fill: @aeroway-fill;
@taxiway-fill: @aeroway-fill;
@helipad-fill: @aeroway-fill;
@access-marking: #eaeaea;
@access-marking-light: #f0f0f0;
@access-marking-secondary: #e4e4e4;
@access-marking-white-unpaved: #e0e0e0;
@access-marking-living-street: #d4d4d4;
@default-casing: white;
@tertiary-casing: #8f8f8f;
@residential-casing: #bbb;
@road-casing: @residential-casing;
@service-casing: @residential-casing;
@living-street-casing: @residential-casing;
@pedestrian-casing: #999;
@path-casing: @default-casing;
@footway-casing: @default-casing;
@steps-casing: @default-casing;
@cycleway-casing: @default-casing;
@bridleway-casing: @default-casing;
@track-casing: @default-casing;
@tertiary-shield: #3b3b3b;
@unimportant-road: @residential-casing;
@minor-construction: #aaa;
@service-construction: #aaa;
@destination-marking: #c2e0ff;
@private-marking: #efa9a9;
@private-marking-for-red: #C26363;
@tunnel-casing: grey;
@bridge-casing: black;
@motorway-tunnel-fill: lighten(@motorway-fill, 10%);
@trunk-tunnel-fill: lighten(@trunk-fill, 10%);
@primary-tunnel-fill: lighten(@primary-fill, 10%);
@secondary-tunnel-fill: lighten(@secondary-fill, 5%);
@tertiary-tunnel-fill: lighten(@tertiary-fill, 5%);
@residential-tunnel-fill: darken(@residential-fill, 5%);
@living-street-tunnel-fill: lighten(@living-street-fill, 3%);
@service-tunnel-fill: darken(white, 5%);
@bus-guideway-fill: #6699ff;
@bus-guideway-tunnel-fill: lighten(desaturate(@bus-guideway-fill, 20%), 8%);
@motorway-width-z6:               0.4;
@trunk-width-z6:                  0.4;
@motorway-width-z7:               0.8;
@trunk-width-z7:                  0.6;
@motorway-width-z8:               1;
@trunk-width-z8:                  1;
@primary-width-z8:                1;
@motorway-width-z9:               1.4;
@trunk-width-z9:                  1.4;
@primary-width-z9:                1.4;
@secondary-width-z9:              1;
@motorway-width-z10:              1.9;
@trunk-width-z10:                 1.9;
@primary-width-z10:               1.8;
@secondary-width-z10:             1.1;
@tertiary-width-z10:              0.7;
@motorway-width-z11:              2.0;
@trunk-width-z11:                 1.9;
@primary-width-z11:               1.8;
@secondary-width-z11:             1.1;
@tertiary-width-z11:              0.7;
@motorway-width-z12:              3.5;
@motorway-link-width-z12:         1.5;
@trunk-width-z12:                 3.5;
@trunk-link-width-z12:            1.5;
@primary-width-z12:               3.5;
@primary-link-width-z12:          1.5;
@secondary-width-z12:             3.5;
@secondary-link-width-z12:        1.5;
@tertiary-width-z12:              2.5;
@tertiary-link-width-z12:         1.5;
@residential-width-z12:           0.5;
@unclassified-width-z12:          0.8;
@motorway-width-z13:              6;
@motorway-link-width-z13:         4;
@trunk-width-z13:                 6;
@trunk-link-width-z13:             4;
@primary-width-z13:               5;
@primary-link-width-z13:          4;
@secondary-width-z13:             5;
@secondary-link-width-z13:        4;
@tertiary-width-z13:              4;
@tertiary-link-width-z13:         3;
@residential-width-z13:           2.5;
@living-street-width-z13:         2;
@bridleway-width-z13:             0.3;
@footway-width-z14:               0.7;
@cycleway-width-z13:              0.7;
@track-width-z13:                 0.5;
@track-grade1-width-z13:          0.5;
@track-grade2-width-z13:          0.5;
@secondary-width-z14:             5;
@tertiary-width-z14:              5;
@residential-width-z14:           3;
@living-street-width-z14:         3;
@pedestrian-width-z14:            3;
@road-width-z14:                  2;
@service-width-z14:               2;
@steps-width-z14:                 0.7;
@motorway-width-z15:             10;
@motorway-link-width-z15:         7.8;
@trunk-width-z15:                10;
@trunk-link-width-z15:          7.8;
@primary-width-z15:              10;
@primary-link-width-z15:        7.8;
@secondary-width-z15:             9;
@secondary-link-width-z15:        7;
@tertiary-width-z15:              9;
@tertiary-link-width-z15:         7;
@residential-width-z15:           5;
@living-street-width-z15:         5;
@pedestrian-width-z15:            5;
@bridleway-width-z15:             1.2;
@footway-width-z15:               1;
@cycleway-width-z15:              0.9;
@track-width-z15:                 1.5;
@track-grade1-width-z15:          0.75;
@track-grade2-width-z15:          0.75;
@steps-width-z15:                 3;
@secondary-width-z16:            10;
@tertiary-width-z16:             10;
@residential-width-z16:           6;
@living-street-width-z16:         6;
@pedestrian-width-z16:            6;
@road-width-z16:                  3.5;
@service-width-z16:               3.5;
@minor-service-width-z16:         2;
@footway-width-z16:               1.3;
@cycleway-width-z16:              0.9;
@motorway-width-z17:             18;
@motorway-link-width-z17:        12;
@trunk-width-z17:                18;
@trunk-link-width-z17:           12;
@primary-width-z17:              18;
@primary-link-width-z17:         12;
@secondary-width-z17:            18;
@secondary-link-width-z17:       12;
@tertiary-width-z17:             18;
@tertiary-link-width-z17:        12;
@residential-width-z17:          12;
@living-street-width-z17:        12;
@pedestrian-width-z17:           12;
@road-width-z17:                  7;
@service-width-z17:               7;
@minor-service-width-z17:         3.5;
@motorway-width-z18:             21;
@motorway-link-width-z18:        13;
@trunk-width-z18:                21;
@trunk-link-width-z18:           13;
@primary-width-z18:              21;
@primary-link-width-z18:         13;
@secondary-width-z18:            21;
@secondary-link-width-z18:       13;
@tertiary-width-z18:             21;
@tertiary-link-width-z18:        13;
@residential-width-z18:          13;
@living-street-width-z18:        13;
@pedestrian-width-z18:           13;
@road-width-z18:                  8.5;
@service-width-z18:               8.5;
@minor-service-width-z18:         4.75;
@footway-width-z18:               1.3;
@cycleway-width-z18:              1;
@motorway-width-z19:             27;
@motorway-link-width-z19:        16;
@trunk-width-z19:                27;
@trunk-link-width-z19:           16;
@primary-width-z19:              27;
@primary-link-width-z19:         16;
@secondary-width-z19:            27;
@secondary-link-width-z19:       16;
@tertiary-width-z19:             27;
@tertiary-link-width-z19:        16;
@residential-width-z19:          17;
@living-street-width-z19:        17;
@pedestrian-width-z19:           17;
@road-width-z19:                 11;
@service-width-z19:              11;
@minor-service-width-z19:         5.5;
@footway-width-z19:               1.6;
@cycleway-width-z19:              1.3;
@motorway-width-z20:             33;
@motorway-link-width-z20:        17;
@service-width-z20:              12;
@minor-service-width-z20:         8.5;
@major-casing-width-z11:          0.3;
@casing-width-z12:                0.3;
@secondary-casing-width-z12:      0.3;
@major-casing-width-z12:          0.5;
@casing-width-z13:                0.5;
@residential-casing-width-z13:    0.5;
@secondary-casing-width-z13:      0.35;
@major-casing-width-z13:          0.5;
@casing-width-z14:                0.55;
@secondary-casing-width-z14:      0.35;
@major-casing-width-z14:          0.6;
@casing-width-z15:                0.6;
@secondary-casing-width-z15:      0.7;
@major-casing-width-z15:          0.7;
@casing-width-z16:                0.6;
@secondary-casing-width-z16:      0.7;
@major-casing-width-z16:          0.7;
@casing-width-z17:                0.8;
@secondary-casing-width-z17:      1;
@major-casing-width-z17:          1;
@casing-width-z18:                0.8;
@secondary-casing-width-z18:      1;
@major-casing-width-z18:          1;
@casing-width-z19:                0.8;
@secondary-casing-width-z19:      1;
@major-casing-width-z19:          1;
@casing-width-z20:                0.8;
@secondary-casing-width-z20:      1;
@major-casing-width-z20:          1;
@bridge-casing-width-z12:         0.1;
@major-bridge-casing-width-z12:   0.5;
@bridge-casing-width-z13:         0.5;
@major-bridge-casing-width-z13:   0.5;
@bridge-casing-width-z14:         0.5;
@major-bridge-casing-width-z14:   0.6;
@bridge-casing-width-z15:         0.75;
@major-bridge-casing-width-z15:   0.75;
@bridge-casing-width-z16:         0.75;
@major-bridge-casing-width-z16:   0.75;
@bridge-casing-width-z17:         0.8;
@major-bridge-casing-width-z17:   1;
@bridge-casing-width-z18:         0.8;
@major-bridge-casing-width-z18:   1;
@bridge-casing-width-z19:         0.8;
@major-bridge-casing-width-z19:   1;
@bridge-casing-width-z20:         0.8;
@major-bridge-casing-width-z20:   1;
@paths-background-width:          1;
@paths-bridge-casing-width:       0.5;
@paths-tunnel-casing-width:       1;
@mini-roundabout-width:           4;
@turning-circle-factor:           1.6;
@junction-text-color:             #960000;
@halo-color-for-minor-road:       white;
@lowzoom-halo-color:              white;
@lowzoom-halo-width:              1;
@lowzoom-halo-opacity:			  0.4; 
@motorway-oneway-arrow-color:     darken(@motorway-casing, 25%);
@trunk-oneway-arrow-color:        darken(@trunk-casing, 25%);
@primary-oneway-arrow-color:      darken(@primary-casing, 15%);
@secondary-oneway-arrow-color:    darken(@secondary-casing, 10%);
@tertiary-oneway-arrow-color:     darken(@tertiary-casing, 30%);
@residential-oneway-arrow-color:  darken(@residential-casing, 40%);
@living-street-oneway-arrow-color: darken(@residential-casing, 30%);
@pedestrian-oneway-arrow-color:   darken(@pedestrian-casing, 25%);
@bus-guideway-oneway-arrow-color: darken(@bus-guideway-fill, 25%);
@raceway-oneway-arrow-color:      darken(@raceway-fill, 50%);
@footway-oneway-arrow-color:      darken(@footway-fill, 35%);
@steps-oneway-arrow-color:        darken(@steps-fill, 35%);
@cycleway-oneway-arrow-color:     darken(@cycleway-fill, 25%);
@track-oneway-arrow-color:        darken(@track-fill, 10%);
@bridleway-oneway-arrow-color:    darken(@bridleway-fill, 15%);
@shield-size: 10;
@shield-line-spacing: -1.50; // -0.15 em
@shield-size-z16: 11;
@shield-line-spacing-z16: -1.65; // -0.15 em
@shield-size-z18: 12;
@shield-line-spacing-z18: -1.80; // -0.15 em
@shield-spacing: 760;
@shield-repeat-distance: 400;
@shield-margin: 40;
@shield-font: @book-fonts;
@shield-clip: false;
@major-highway-text-repeat-distance: 50;
@minor-highway-text-repeat-distance: 10;

@railway-bridge-fill: white;
@railway-casing-major: #707070;
@railway-casing-minor: #aaa;
@railway-casing-spur: #666;
@railway-main-line: #787878;
@railway-spur-line: #ccc;
@railway-construction-line: #999;
@railway-disused-line: #bbb;
@railway-monorail-line: #6E6E6E;
@railway-background: #fff;
@railway-tram-line: #777;
@railway-text-repeat-distance: 200;
@railway-text: #666666;

@turning-circle-fill: #fff;
@road-text-major: #333;
@road-text-minor: #000;
@road-text-path: #222;

/* From stations.mss */
@station-color: #7981b0;
@station-text: darken(saturate(@station-color, 15%), 10%);

/* From style.mss */
@water-color: #aad3df;
@land-color: #f2efe9;
@standard-halo-radius: 1;
@standard-halo-fill: rgba(255,255,255,0.6);

/* From tourism.mss */
@roller-coaster-casing: #707070;
@roller-coaster-fill: #ddd;
@roller-coaster-bridge-casing: #000;

/* From aerialways.mss */
@aerialway-line: #808080;
@aerialway-dash: black;
@aerialway-goods-dash: #707070;
@conveyor-line: #999999;
@pipeline-line: #909090;
@pipeline-gas-center: #c1c1c1;
@pipeline-oil-center: #cfbfa5;
@aerialway-text: #666666;

/* From water-features.mss */
@breakwater-color: #aaa; /* Also for groyne */
@dam: #adadad;
@dam-line: #444444;
@weir-line: #aaa;
@lock-gate: #aaa;
@lock-gate-line: #aaa;
@marina-area-line-color: blue;
@water-barrier-text: #222;

/* From water.mss */
@water-text: #4d80b3;
@glacier: #ddecec;
@glacier-line: #9cf;
@waterway-text-repeat-distance: 200;
@waterway-casing: white;
@waterway-bridge-casing: black;
@waterway-bridge-fill: white;
@waterway-tunnel-fill: #f3f7f7;
@waterway-bridge-glow: white;
@waterslide-bridge-casing: black;
@aeroway-gate-text: black;

let alchemicals = [
  {
    name: "Ignis",
    text: [
      "Gain {C:attention}+#1#{} discard for this blind"
    ],
    text_vars: [1],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 0,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Aqua",
    text: [
      "Gain {C:attention}+#1#{} hand for this blind"
    ],
    text_vars: [1],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 1,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Terra",
    text: [
      "Reduce blind by {C:attention}#1#%{}"
    ],
    text_vars: [20],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 2,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Aero",
    text: [
      "Draw {C:attention}#1#{} cards"
    ],
    text_vars: [4],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 3,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Quicksilver",
    text: [
      "{C:attention}+#1#{} hand size for this blind"
    ],
    text_vars: [2],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 4,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Salt",
    text: [
      "Increase blind by 10% to gain {C:attention}#1#{} tag"
    ],
    text_vars: [1],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 5,
      y: 0
    },
    rarity: "Alchemical"
  },
  {
    name: "Sulfur",
    text: [
      "Reduce hands to {C:attention}1 Gain {C:attention}$#1#{} for each hand removed"
    ],
    text_vars: [4],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 0,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Phosphorus",
    text: [
      "Return {C:attention}all{} discarded cards to deck"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 1,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Bismuth",
    text: [
      "Converts the rightmost joker to {C:dark_edition}Polychrome{} for one blind"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 2,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Cobalt",
    text: [
      "Upgrade currently selected {C:attention}poker hand by {C:attention}#1#{} levels for one blind"
    ],
    text_vars: [2],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 3,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Arsenic",
    text: [
      "{C:attention}Swap{} your current hands and discards"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 4,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Antimony",
    text: [
      "Create a {C:dark_edition}Negative{}","{C:eternal}0-cost{} {C:attention}copy{} of a random joker for one blind"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 5,
      y: 1
    },
    rarity: "Alchemical"
  },
  {
    name: "Soap",
    text: [
      "Replace up to {C:attention}#1#{} selected cards with cards from your deck"
    ],
    text_vars: [3],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 0,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Manganese",
    text: [
      "Enhances up to {C:attention}#1#{} selected cards into {C:attention}Steel Cards for one blind"
    ],
    text_vars: [3],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 1,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Wax",
    text: [
      "Create {C:attention}#1#{} temporary copies of selected card for one blind",
      "{C:inactive}(Does not trigger jokers){}"
    ],
    text_vars: [1],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 2,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Borax",
    text: [
      "Converts up to {C:attention}#1#{} selected cards into most common {C:attention}suit for one blind"
    ],
    text_vars: [3],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 3,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Glass",
    text: [
      "Enhances up to {C:attention}#1#{} selected cards into {C:attention}Glass Cards for one blind",
	    "{C:inactive}Destroyed glass cards will not return"
    ],
    text_vars: [2],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 4,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Magnet",
    text: [
      "Draw {C:attention}#1#{} cards of the same rank as the selected card"
    ],
    text_vars: [2],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 5,
      y: 2
    },
    rarity: "Alchemical"
  },
  {
    name: "Gold",
    text: [
      "{C:attention}Double{} the value of all {C:attention}gold cards{} currently in hand for one blind"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 0,
      y: 3
    },
    rarity: "Alchemical"
  },
  {
    name: "Silver",
    text: [
      "Enhances up to {C:attention}#1#{} selected cards into {C:attention}Lucky Cards for one blind"
    ],
    text_vars: [3],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 1,
      y: 3
    },
    rarity: "Alchemical"
  },
  {
    name: "Oil",
    text: [
      "Prevents all cards currently in hand from being {C:attention}debuffed{} or flipped {C:attention}face down{} for this blind"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 2,
      y: 3
    },
    rarity: "Alchemical"
  },
  {
    name: "Acid",
    text: [
      "{C:attention}Destroy{} all cards of the same rank or suit as selected card.", 
      "All cards {C:attention}returned{} after this blind",
      "{C:inactive}(Does not trigger jokers){}"
    ],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 3,
      y: 3
    },
    rarity: "Alchemical"
  },
  {
    name: "Brimstone",
    text: [
      "{C:attention}+#1#{} hands, {C:attention}+#1#{} discards. Debuff the left most non-debuffed joker for one blind"
    ],
    text_vars: [2],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 4,
      y: 3
    },
    rarity: "Alchemical"
  },
  {
    name: "Uranium",
    text: [
      "Copy the selected card's {C:attention}enhancement{}, {C:attention}seal{}, and {C:attention}edition to {C:attention}#1#{} random unenhanced cards for one blind"
    ],
    text_vars: [3],
    image_url: "img/alchemical_atlas.png",
    image_pos: {
      x: 5,
      y: 3
    },
    rarity: "Alchemical"
  },
]

let jokers = [
  {
    name: "Studious Joker",
    text: [
      "{C:mult}+#1#{} Mult. Sell this joker to get one {C:alchemical} Alchemical{} card"
    ],
    text_vars: [3],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 0,
      y: 0
    },
    rarity: "Common"
  },
  {
    name: "Bottled Buffoon",
    text: [
      "Create an {C:alchemical}Alchemical{} card every {C:attention}#1#{} hands played",
    ],
    text_vars: [4],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 1,
      y: 0
    },
    rarity: "Common"
  },
  {
    name: "Mutated Joker",
    text: [
      "{C:chips}+#1#{} Chips for each unique {C:alchemical}Alchemical{} card used this run",
    ],
    text_vars: [0],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: Math.random() < 0.001 ? 2 : 1,
      y: 2
    },
    rarity: "Common"
  },
  {
    name: "Essence of Comedy",
    text: [
      "Gains {X:mult,C:white}X#1#{} Mult per {C:alchemical}Alchemical{} card used"
    ],
    text_vars: [0.1],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 0,
      y: 1
    },
    rarity: "Uncommon"
  },
  {
    name: "Shock Humor",
    text: [
      "{C:green}1 in #1#{} chance to create an {C:alchemical}Alchemical{} card when you discard a {C:attention}Gold{}, {C:attention}Steel{} or {C:attention}Stone{} card"
    ],
    text_vars: [5],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 1,
      y: 1
    },
    rarity: "Uncommon"
  },
  {
    name: "Breaking Bozo",
    text: [
      "After you use an {C:alchemical}Alchemical{} card, do one at random: ",
      "- Reduce blind by {C:attention}10%{}",
      "- Draw {C:attention}2{} cards",
      "- Earn {C:attention}$5{}"
    ],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 2,
      y: 1
    },
    rarity: "Uncommon"
  },
  {
    name: "Chain Reaction",
    text: [
      "Create a {C:attention}Copy{} of the first {C:alchemical}Alchemical{} card used each blind",
      "{C:inactive}(Must have room){}"
    ],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 2,
      y: 0
    },
    rarity: "Rare"
  },
  {
    name: "Catalyst Joker",
    text: [
      "{C:attention}+1{} consumable slots.",
      "Gains {X:mult,C:white} X#1#{} Mult for every {C:attention}Consumable Card{} held"
    ],
    text_vars: [0.5],
    image_url: "img/ca_joker_atlas.png",
    image_pos: {
      x: 0,
      y: 2
    },
    rarity: "Rare"
  }
]

// works the same. 
let consumables_tarot = [
  {
    name: "The Seeker",
    text: [
      "Creates up to {C:attention}#1# random {C:alchemical}Alchemical{} cards",
      "{C:inactive}(Must have room)",
    ],
    text_vars: [2],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 0,
      y: 0
    },
    rarity: "Tarot"
  },
]
let consumables_spectral = [
  {
    name: "",
    text: [
        "{C:dark_edition}???{}"
    ],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 0,
      y: 1
    },
    rarity: "Spectral"
  },
]

let card_modifications = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Enhancement"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Edition"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Seal"
  // },
]

let decks = [
  {
    name: "Herbalist's Deck",
    text: [
      "Start run with the",
      "{C:tarot,T:v_mortar_and_pestle}Mortar and Pestle{} voucher,", "Gain an {C:alchemical}Alchemical{} card before each boss blind"
    ],
    image_url: "img/ca_decks_atlas.png",
    image_pos: {
      x: 1,
      y: 0
    },
    rarity: "Deck"
  },
  {
    name: "Philosopher's Deck",
    text: [
      "Start run with the",
      "{C:tarot,T:v_alchemical_merchant}Alchemical Merchant{} voucher and a copy of {C:tarot,T:c_seeker}The Seeker{}"
    ],
    image_url: "img/ca_decks_atlas.png",
    image_pos: {
      x: 0,
      y: 0
    },
    rarity: "Deck"
  },
]

let sleeves = [
  {
    name: "Herbalist's Sleeve",
    text: [],
    image_url: "img/ra_sleeves_atlas.png",
    image_pos: {
      x: 1,
      y: 0
    },
    rarity: "Sleeve"
  },
  {
    name: "Philosopher's Sleeves",
    text: [],
    image_url: "img/ra_sleeves_atlas.png",
    image_pos: {
      x: 0,
      y: 0
    },
    rarity: "Sleeve"
  },
]

let stickers = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Sticker"
  // },
]

let blinds = [
  {
    name: "The Bane",
    text: [ 'All Consumables', 'are debuffed' ],
    image_url: "img/ra_blind_atlas.png",
    rarity: "Boss Blind"
  },
  // {
  //   name: "Violet Vessel",
  //   text: [
  //     "Very large blind",
  //     "{C:inactive}({C:red}6x{C:inactive} Base for {C:attention}$$$$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 8)"
  //   ],
  //   image_url: "img/violet_vessel.png",
  //   rarity: "Showdown"
  // },
]

let shop_items = [
  {
    name: "Mortar and Pestle",
    text: [
      "{C:attention}+1{} consumable slot"
    ],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 0,
      y: 2
    },
    rarity: "Voucher"
  },
  {
    name: "Cauldron",
    text: [
      "{C:dark_edition}Negative{} {C:alchemical}Alchemical{} cards appear much more often"
    ],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 0,
      y: 3
    },
    rarity: "Voucher"
  },
  {
    name: "Alchemical Merchant",
    text: [
      "{C:alchemical}Alchemical{} cards can appear in the {C:attention}shop",
    ],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 1,
      y: 2
    },
    rarity: "Voucher"
  },
  {
    name: "Alchemical Tycoon",
    text: [
      "{C:alchemical}Alchemical{} cards appear {C:attention}2X{} more frequently in the shop"
    ],
    image_url: "img/ca_others_atlas.png",
    image_pos: {
      x: 1,
      y: 3
    },
    rarity: "Voucher"
  },
]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  ALCHEMICAL: "#C09D75",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Alchemical": "#C09D75",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sleeve": "#9bb6bd",
  "Sticker": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",
}

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div, card_width, card_height) => {
  for (let joker of jokers) {
    console.log("adding joker", joker.name);
  
    joker.text = joker.text.map((line) => { return line + "{}"});
  
    joker.text = joker.text.join("<br/>");
    if (joker.text_vars){
      for (i = 0; i < joker.text_vars.length; i++){
        joker.text = joker.text.replaceAll(`#${i + 1}#`, joker.text_vars[i]);
      }
    }
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");
  
      let css_styling = "";
  
      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }
  
      return `</span><span style='${css_styling}'>`;
    });
  
    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      let image_str = `<img src="${joker.image_url}" alt="${joker.name}"/>`
      card_width = card_width ?? 142
      card_height = card_height ?? 190
      if (joker.image_pos) {
        image_str = `<p src="${joker.image_url}" alt="${joker.name}" width="1" height="1" style="width: ${card_width}px; height: ${card_height}px; background: url(${joker.image_url}) -${joker.image_pos.x * card_width}px -${joker.image_pos.y * card_height}px;"/>`
      }

      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        ${image_str}
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }
  
    jokers_div.appendChild(joker_div);
  }
}

if (consumables_spectral.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables_spectral, consumables_div);
}

if (alchemicals.length === 0) {
  document.querySelector(".alchemicalsfull").style.display = "none"
} else {
  let alchemicals_div = document.querySelector(".alchemicals");
  add_cards_to_div(alchemicals, alchemicals_div);
}

if (jokers.length === 0) {
  document.querySelector(".jokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".jokers");
  add_cards_to_div(jokers, jokers_div);
}

// if (card_modifications.length === 0) {
//   document.querySelector(".cardmodsfull").style.display = "none"
// } else {
//   let cardmods_div = document.querySelector(".cardmods");
//   add_cards_to_div(card_modifications, cardmods_div);
// }

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (sleeves.length === 0) {
  document.querySelector(".sleevesfull").style.display = "none"
} else {
  let sleeves_div = document.querySelector(".sleeves");
  add_cards_to_div(sleeves, sleeves_div, 146);
}

// if (stickers.length === 0) {
//   document.querySelector(".stickersfull").style.display = "none"
// } else {
//   let stickers_div = document.querySelector(".stickers");
//   add_cards_to_div(stickers, stickers_div);
// }

if (blinds.length === 0) {
  document.querySelector(".blindsfull").style.display = "none"
} else {
  let blinds_div = document.querySelector(".blinds");
  add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
  document.querySelector(".shopitemsfull").style.display = "none"
} else {
  let shopitems_div = document.querySelector(".shopitems");
  add_cards_to_div(shop_items.concat(consumables_tarot), shopitems_div);
}
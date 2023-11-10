import { defineStore } from 'pinia';

let navLang = navigator.language.split('-')[0]
const appLangs = ['pt', 'en', 'es']
var appInitLang = 'en'
var appInitLangIDX = appLangs.includes(navLang) ? appLangs.indexOf(navLang) : 1;

if ( appInitLangIDX > -1 )
{
  appInitLang = appLangs[ appInitLangIDX ]
}

export const useAppStore = defineStore({
  
  id: 'app',
  
  state: () => ({

    prevLang: appInitLang,
    lang: appInitLang,

    langIndex: appInitLangIDX,
    langs: appLangs,

  }),

  actions: {

    toggleLang() {
      
        let self = this

        this.langIndex++;
        this.langIndex = this.langIndex % this.langs.length

        this.lang = this.langs[this.langIndex];

        setTimeout(function(){
            self.prevLang = self.lang
        }, 10)

    },
  

  },
});

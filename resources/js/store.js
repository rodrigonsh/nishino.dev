import { defineStore } from 'pinia';

export const useAppStore = defineStore({
  
  id: 'app',
  
  state: () => ({

    prevLang: 'pt',
    lang: 'pt',

    langIndex: 0,
    langs: ['pt', 'en', 'es'],

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

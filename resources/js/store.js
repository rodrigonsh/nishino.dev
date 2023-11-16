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

    chatLoading: false,
    chatMessages: [
      {key: 0, user: "Harvey Wood", message: "Hola! Now to business!"}
    ]

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


    setUserMessage(msg) { this.chatMessages.push({key: new Date().valueOf() , 'user': 'Você', 'message': msg }) },
    
    setAssistantMessage(msg) { this.chatMessages.push({key: new Date().valueOf() ,'user': 'Harvey Wood', 'message': msg }) },
    
    setChatStatus( status ){ console.log('setando status', status); this.chatLoading = status }

  },
});

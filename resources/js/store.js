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
    chatMessages: [],
    clientMessages: [],
    donnaMessages: []

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


    setUserMessage(onde, msg)
    {

      let mensagem = {key: new Date().valueOf() , 'user': 'Você', 'message': msg }

      if(onde == 'harvey-front') this.chatMessages.push(mensagem) 
      if(onde == 'harvey-client') this.clientMessages.push(mensagem) 
      if(onde == 'donna') this.donnaMessages.push(mensagem) 
    },
    
    setAssistantMessage(onde, msg)
    {

      let mensagem = {key: new Date().valueOf() ,'user': 'Harvey Wood', 'message': msg }

      if ( onde == 'harvey-front') this.chatMessages.push(mensagem) 
      if ( onde == 'harvey-client') this.clientMessages.push(mensagem) 
      if ( onde == 'donna')
      {
        mensagem.user = "Donna"
        this.donnaMessages.push(mensagem) 
      }
      
    },
    
    setChatStatus( status ){ console.log('setando status', status); this.chatLoading = status }




  },
});

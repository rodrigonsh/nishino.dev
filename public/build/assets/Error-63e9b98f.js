import{_ as l}from"./GuestLayout-9eb3cbf6.js";import{r as e,o as i,c as m,w as r,a as o,b as t,t as p}from"./app-089cc349.js";const d=t("img",{src:"/img/error.gif",class:"w-100"},null,-1),f=t("h1",null,"OOPS!",-1),C={__name:"Error",props:{error_message:String},setup(a){return(u,g)=>{const s=e("Head"),n=e("v-card"),c=e("v-container"),_=e("CTA");return i(),m(l,{canLogin:!1,canRegister:!1,title:"Error"},{default:r(()=>[o(s,{title:"Error"}),o(c,{class:"h-100 pa-16"},{default:r(()=>[o(n,{class:"pa-16"},{default:r(()=>[d,f,t("p",null,p(a.error_message),1)]),_:1})]),_:1}),o(_)]),_:1})}}};export{C as default};
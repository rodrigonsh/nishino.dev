import{o as B,c as A,w as e,a as t,u as c,g as r,b as o,d as n,t as L,l as N,r as a}from"./app-ae953136.js";const S=o("img",{src:"/img/logo-nsh.svg",class:"app-logo d-block w-100 mb-3"},null,-1),D=o("span",{class:"d-block text-center"},"Desenvolvimento e Consultoria",-1),G={class:"w-100 mb-2"},I={href:"https://api.whatsapp.com/send?phone=5567981849417",target:"_blank"},O={class:"w-100 mb-2"},R={href:"https://github.com/rodrigonsh",target:"_blank"},T={class:"w-100 mb-2"},z={href:"https://discord.gg/TadZ4GvKay",target:"_blank"},H=o("img",{src:"/img/logo-discord.svg",class:"icon"},null,-1),M={class:"w-100"},U={href:"mailto:rodrigo.nsh@gmail.com",target:"_blank"},W=o("small",null,[o("p",null,[o("strong",null,"RODRIGO CALANCA NISHINO LTDA")]),o("p",null,"48.129.023/0001-27"),o("p",null,[n(" Avenida Afluente, 1070"),o("br"),n(" Vila Fernanda"),o("br"),n(" Campo Grande / MS"),o("br"),n(" 79096-149 ")])],-1),$={class:"ma-4"},j={data:()=>({drawer:window.innerWidth>600})},F=Object.assign(j,{__name:"GuestLayout",props:{canLogin:Boolean,canRegister:Boolean,title:String},setup(u){function v(){window.location="https://api.whatsapp.com/send?phone=5567981849417"}return(s,i)=>{const _=a("v-list-item"),d=a("v-divider"),b=a("v-list"),g=a("v-card"),p=a("v-icon"),l=a("v-btn"),h=a("v-container"),f=a("v-navigation-drawer"),w=a("v-app-bar-nav-icon"),k=a("v-app-bar-title"),C=a("v-app-bar"),y=a("VLayoutItem"),V=a("v-main"),x=a("v-app");return B(),A(x,null,{default:e(()=>[t(f,{color:"surf",modelValue:s.drawer,"onUpdate:modelValue":i[0]||(i[0]=m=>s.drawer=m)},{default:e(()=>[t(h,{class:"pa-5 d-flex flex-column"},{default:e(()=>[t(c(r),{href:"/",class:"d-block w-75 my-6 mx-auto"},{default:e(()=>[S,D]),_:1}),t(g,{class:"w-100 mb-6"},{default:e(()=>[t(b,{lines:"one"},{default:e(()=>[t(c(r),{href:"/about"},{default:e(()=>[t(_,{"prepend-icon":"mdi-information",title:"Saiba Mais",ripple:!0,link:""})]),_:1}),t(d),t(c(r),{href:"/blog"},{default:e(()=>[t(_,{"prepend-icon":"mdi-post",title:"Blog",ripple:!0})]),_:1}),t(d),t(c(r),{href:"/contato"},{default:e(()=>[t(_,{"prepend-icon":"mdi-message",title:"Contato",ripple:!0})]),_:1})]),_:1})]),_:1}),t(d,{class:"mb-5"}),o("p",G,[o("a",I,[t(l,{variant:"outlined",class:"d-block w-100 bg-primary text-white"},{default:e(()=>[t(p,{icon:"mdi-whatsapp"}),n(" Whatsapp ")]),_:1})])]),o("p",O,[o("a",R,[t(l,{variant:"outlined",class:"d-block w-100 bg-primary text-white"},{default:e(()=>[t(p,{icon:"mdi-github"}),n(" GitHUB ")]),_:1})])]),o("p",T,[o("a",z,[t(l,{variant:"outlined",class:"d-block w-100 bg-primary text-white"},{default:e(()=>[H,n(" Discord ")]),_:1})])]),o("p",M,[o("a",U,[t(l,{variant:"tonal",class:"d-block w-100"},{default:e(()=>[t(p,{icon:"mdi-email-outline"}),n(" Email ")]),_:1})])]),W]),_:1})]),_:1},8,["modelValue"]),t(C,{class:"bg-pokedex"},{default:e(()=>[t(w,{onClick:i[1]||(i[1]=m=>s.drawer=!s.drawer)}),t(k,null,{default:e(()=>[n(L(u.title),1)]),_:1})]),_:1}),t(V,{class:"bg-forest"},{default:e(()=>[N(s.$slots,"default"),t(y,{"model-value":"",position:"bottom",class:"text-end",size:"88"},{default:e(()=>[o("div",$,[t(l,{icon:"mdi-whatsapp",onClick:v,size:"large",color:"green",elevation:"8"})])]),_:1})]),_:3})]),_:3})}}});export{F as _};
import{k as _,r as c,o as t,c as p,w as y,a as i,u,X as S,b as e,h as m,i as T,F as x,n as C,e as V,d,t as v}from"./app-c063e290.js";import{I as B}from"./rules-bcd4dbe1.js";import{u as L,_ as R}from"./GuestLayout-a7c970c1.js";import"./sweetalert2.all-da26d9dc.js";const w={class:"chatMessage"},A=e("p",{class:"harvey"},[e("strong",null,[d("Harvey Wood: "),e("br")]),e("span",{lang:"pt"},"Você está conversando com Harvey, uma AI desenhada para entender suas necessidades e negociar um bom acordo. Começe me dizendo seu nome e seu endereço de email"),e("span",{lang:"en"},"You are talking to Harvey, an AI designed to understand your needs and negotiate a good deal. Start by telling me your name and your email address"),e("span",{lang:"es"},"Estás hablando con Harvey, una IA diseñada para comprender tus necesidades y negociar un buen trato. Empieza diciéndome tu nombre y dirección de correo electrónico.")],-1),I={key:2,class:"harvey"},q=e("strong",null,[d("Harvey Wood: "),e("br")],-1),z={key:3,class:"user"},F=e("br",null,null,-1),W=["value"],U={__name:"Chat",props:{canLogin:Boolean,canRegister:Boolean,laravelToken:String},setup(h){const n=L(),f=function(o){return{message:{pt:"Mensagem",en:"Message",es:"Mensaje"}}[o][n.lang]},r=_(),l=_(""),b=()=>{n.setChatStatus(!0),n.setUserMessage(l.value),setTimeout(function(){r.value.scrollTop=r.value.scrollHeight});let o=new FormData(document.querySelector("#send"));o.append("message",l.value),o.append("lang",n.lang);let a=new XMLHttpRequest;a.onload=function(){n.setAssistantMessage(a.responseText),n.setChatStatus(!1),setTimeout(function(){r.value.scrollTop=r.value.scrollHeight})},a.open("POST",route("message")),a.send(o),l.value=""};return(o,a)=>{const g=c("v-avatar"),k=c("v-text-field"),H=c("v-btn"),M=c("v-container");return t(),p(R,{canLogin:"canRegister",canRegister:"canRegister",title:"Harvey",customClass:"chat"},{default:y(()=>[i(u(S),{title:"Fale conosco"}),i(M,{id:"chat"},{default:y(()=>[e("div",{class:C({chatMessages:!0,loading:u(n).chatLoading}),ref_key:"messages",ref:r},[e("div",w,[i(g,{class:"mr-2 mt-3",image:"/img/harvey-profile.png"}),A]),(t(!0),m(x,null,T(u(n).chatMessages,s=>(t(),m("div",{class:"chatMessage",key:s.key},[s.user=="Harvey Wood"?(t(),p(g,{key:0,class:"mr-2 mt-3",image:"/img/harvey-profile.png"})):(t(),p(g,{key:1,class:"mr-2 mt-3",image:"/img/user-profile.jpg"})),s.user=="Harvey Wood"?(t(),m("p",I,[q,d(" "+v(s.message),1)])):(t(),m("p",z,[e("strong",null,[d(v(s.user)+": ",1),F]),d(" "+v(s.message),1)]))]))),128))],2),e("form",{onSubmit:a[1]||(a[1]=V(s=>b(),["prevent"])),id:"send"},[e("input",{type:"hidden",name:"_token",value:h.laravelToken},null,8,W),i(k,{variant:"underlined","prepend-inner-icon":"mdi-message",modelValue:l.value,"onUpdate:modelValue":a[0]||(a[0]=s=>l.value=s),label:f("message"),rules:[u(B).required],required:""},null,8,["modelValue","label","rules"]),i(H,{type:"submit",icon:"mdi-send",size:"large",variant:"plain"})],32)]),_:1})]),_:1})}}};export{U as default};
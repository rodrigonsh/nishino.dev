import{c as r,w as e,o as s,a,u as c,X as p,h as f,i as v,F as h,r as o,g as B,b as n,t as l,d as S}from"./app-ae953136.js";import{_ as V}from"./GuestLayout-29647bfd.js";const k=["src"],w={class:"pa-4"},b={__name:"Blog",props:{canLogin:Boolean,canRegister:Boolean,laravelVersion:String,phpVersion:String,status:String,posts:Array},setup(i){return(_,x)=>{const u=o("v-card"),g=o("v-col"),d=o("v-row"),m=o("v-container");return s(),r(V,{canLogin:"canRegister",canRegister:"canRegister",title:"BLOG"},{default:e(()=>[a(c(p),{title:"Sobre"}),a(m,{class:"h-100",id:"blog"},{default:e(()=>[a(d,{"no-gutters":""},{default:e(()=>[(s(!0),f(h,null,v(i.posts,t=>(s(),r(g,{key:t.id,cols:"12",sm:"4"},{default:e(()=>[a(c(B),{href:_.route("post",{slug:t.slug})},{default:e(()=>[a(u,{class:"ma-2",elevation:"e3"},{default:e(()=>[n("img",{src:"/storage/"+t.image},null,8,k),n("div",w,[n("h2",null,l(t.title),1),S(" "+l(t.excerpt),1)])]),_:2},1024)]),_:2},1032,["href"])]),_:2},1024))),128))]),_:1})]),_:1})]),_:1})}}};export{b as default};
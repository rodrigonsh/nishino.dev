<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Frontend">
    
    <Head title="Frontend" />

    <v-container class="longtext">

        <h1>Frontend</h1>

        <h2 class="my-6">VueJS</h2>

        <p lang="pt">
            Além de dominar tecnologias tradicionais de desenvolvimento web, incluindo HTML5, CSS3, jQuery 
            e Bootstrap para criar interfaces de usuário responsivas e atraentes para meus aplicativos móveis,
            Também tive várias experiências com React, Angular e NextJS
        </p>
        <p lang="en">
            In addition to mastering traditional web development technologies including HTML5, CSS3, jQuery 
            and Bootstrap to create responsive and attractive user interfaces for my mobile apps, 
            I have also had various experiences with React, Angular and NextJS
        </p>
        <p lang="es">
            Además de dominar las tecnologías de desarrollo web tradicionales, incluidas HTML5, CSS3, jQuery 
            y Bootstrap, para crear interfaces de usuario atractivas y responsivas para mis aplicaciones móviles, 
            también he tenido varias experiencias con React, Angular y NextJS.
        </p>

        <p lang="pt">
            Entretanto meu framework favorito é <strong>VueJS</strong>, esta página é feita em <strong>vuetify</strong>. 
            Trabalhei com sistemas criando 
            <strong>componentes reutilizáveis</strong>,
            <strong>acesso a APIs</strong>,
            <strong>stores (Vuex e Pinia)</strong> e
            <strong>bibliotecas de terceiros</strong>
        </p>
        <p lang="en">
            However, my favorite framework is <strong>VueJS</strong>, this page is made in <strong>vuetify</strong>.
            I worked with systems creating
            <strong>reusable components</strong>,
            <strong>access to APIs</strong>,
            <strong>stores (Vuex and Pinia)</strong> and
            <strong>third-party libraries</strong>
        </p>
        <p lang="es">
            Sin embargo, mi framework favorito es <strong>VueJS</strong>, esta página está hecha en <strong>vuetify</strong>.
            Trabajé con sistemas creando
            <strong>componentes reutilizables</strong>,
            <strong>acceso a las API</strong>,
            <strong>stores (Vuex y Pinia)</strong> y
            <strong>bibliotecas de terceros</strong>
        </p>


        <h2 lang="pt" class="my-6">Desenvolvimento de aplicativos móveis</h2>
        <h2 lang="en" class="my-6">Mobile app development</h2>
        <h2 lang="es" class="my-6">Desarrollo de aplicaciones móviles</h2>

        <p lang="pt">Além de meus serviços de programação web, também ofereço serviços de desenvolvimento de 
            aplicativos móveis. Sou proficiente em usar Cordova e Ionic para desenvolver 
            aplicativos móveis híbridos que podem ser executados em plataformas iOS e Android.
        </p>
        <p lang="en">In addition to my web programming services, I also offer mobile app development 
            services. I am proficient in using Cordova and Ionic to develop hybrid 
            mobile applications that can run on iOS and Android platforms.
        </p>
        <p lang="es">Además de mis servicios de programación web, también ofrezco servicios de 
            desarrollo de aplicaciones móviles. Soy competente en el uso de 
            Cordova e Ionic para desarrollar aplicaciones móviles híbridas que pueden 
            ejecutarse en plataformas iOS y Android.
        </p>

        <h3 class="my-6">Cordova</h3>

        <p lang="pt">
            Cordova é uma plataforma de desenvolvimento de aplicativos móveis que permite 
            aos desenvolvedores criar aplicativos móveis usando HTML, CSS e JavaScript. 
            Sou proficiente em utilizar Cordova para desenvolver aplicativos móveis, incluindo:
        </p>
        <p lang="en">
            Cordova is a mobile app development platform that allows
            developers create mobile applications using HTML, CSS and JavaScript.
            I am proficient in using Cordova to develop mobile applications, including:
        </p>
        <p lang="es">
            Cordova es una plataforma de desarrollo de aplicaciones móviles que permite a
            los desarrolladores crear aplicaciones móviles utilizando HTML, CSS y JavaScript.
            Soy competente en el uso de Cordova para desarrollar aplicaciones móviles, que incluyen:
        </p>

        <ul>

            <li lang="pt">Aplicativos de e-commerce</li>
            <li lang="en">e-Commerce applications</li>
            <li lang="es">Aplicaciones de comercio electrónico</li>

            <li lang="pt">Aplicativos de gerenciamento de conteúdo (CMS)</li>
            <li lang="en">Content Management Applications (CMS)</li>
            <li lang="es">Aplicaciones de gestión de contenidos (CMS)</li>

            <li lang="pt">Aplicativos de produtividade</li>
            <li lang="en">Productivity apps</li>
            <li lang="es">Aplicaciones de productividad</li>

        </ul>
        
        <h3 class="my-6">Ionic</h3>

        <p lang="pt">
            Ionic é um framework de desenvolvimento de aplicativos móveis 
            baseado em <strong>Capacitor</strong> que fornece uma interface de usuário nativa para 
            aplicativos móveis híbridos. Sou proficiente em usar Ionic para desenvolver 
            aplicativos móveis, incluindo:
        </p>
        <p lang="en">
            Ionic is a <strong>Capacitor</strong>-based mobile app development framework that 
            provides a native user interface for
            hybrid mobile apps. I am proficient in using Ionic to develop
            mobile apps including:
        </p>
        <p lang="es">
            Ionic es un framework de desarrollo de aplicaciones móviles basado en 
            <strong>Capacitor</strong> que proporciona una interfaz de usuario nativa para
            Aplicaciones móviles híbridas. Soy competente en el uso de Ionic para desarrollar
            aplicaciones móviles que incluyen:
        </p>

        <ul>

            <li lang="pt">Aplicativos de jogos</li>
            <li lang="en">Game Apps</li>
            <li lang="es">Aplicaciones de juegos</li>

            <li lang="pt">Aplicativos educacionais</li>
            <li lang="en">Educational apps</li>
            <li lang="es">Aplicaciones educativas</li>

            <li lang="pt">Aplicativos de mídia social</li>
            <li lang="en">Social Media Apps</li>
            <li lang="es">Aplicaciones de redes sociales</li>


        </ul>
                

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>

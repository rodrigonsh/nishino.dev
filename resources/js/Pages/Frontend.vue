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

    <v-container class="h-100">

        <h1>Frontend</h1>

        <h2 class="my-6">VueJS</h2>

        <p>
            Além de dominar tecnologias tradicionais de desenvolvimento web, incluindo HTML5, CSS3, jQuery 
            e Bootstrap para criar interfaces de usuário responsivas e atraentes para meus aplicativos móveis.
            Também tive várias experiências com React, Angular e NextJS
        </p>

        <p></p>

        <p>
            Entretanto meu framework favorito é <strong>VueJS</strong>, esta página é feita em vuetify. 
            Você pode mencionar que você é um desenvolvedor VueJS experiente e que pode ajudá-lo a criar aplicativos 
            móveis modernos e eficientes.
        </p>


        <h2 class="my-6">Desenvolvimento de aplicativos móveis</h2>

        <p>Além de meus serviços de programação web, também ofereço serviços de desenvolvimento de 
            aplicativos móveis. Sou proficiente em usar Cordova e Ionic para desenvolver 
            aplicativos móveis híbridos que podem ser executados em plataformas iOS e Android.
        </p>

        <h3 class="my-6">Cordova</h3>

        <p>
            Cordova é uma plataforma de desenvolvimento de aplicativos móveis que permite 
            aos desenvolvedores criar aplicativos móveis usando HTML, CSS e JavaScript. 
            Sou proficiente em usar Cordova para desenvolver aplicativos móveis, incluindo:
        </p>

        <ul>
            <li>Aplicativos de e-commerce</li>
            <li>Aplicativos de gerenciamento de conteúdo (CMS)</li>
            <li>Aplicativos de produtividade</li>
        </ul>
        
        <h3 class="my-6">Ionic</h3>

        <p>
            Ionic é um framework de desenvolvimento de aplicativos móveis 
            baseado em <strong>Capacitor</strong> que fornece uma interface de usuário nativa para 
            aplicativos móveis híbridos. Sou proficiente em usar Ionic para desenvolver 
            aplicativos móveis, incluindo:
        </p>

        <ul>
            <li>Aplicativos de jogos</li>
            <li>Aplicativos de mídia social</li>
            <li>Aplicativos de educação</li>
        </ul>
                

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>

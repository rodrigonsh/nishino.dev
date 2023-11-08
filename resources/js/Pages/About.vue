<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';


defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Nishino">
    
    <Head title="Sobre" />

    <v-container>

        <img id="young-me" src="/img/me.png" />

        <p>Hi! I’m Rodrigo, {{ age }} years, FullStack Developer and Sofia’s father ❤️. I live in Campo Grande / MS - Brazil</p>

        <p>
            I began my firsts steps towards design in 1994 learning Corel
            Draw. I used to draw and print business cards in Campo Limpo
            Paulista / SP.
        </p>

        <p>
            In 2001, when I was studying Biology at UFMS in Corumbá / MS I had access to
            the computer lab with free internet and I decided to learn programming in
            Python through <a href="https://github.com/ramalho/aprendaprog" target="_blank">
                Luciano Ramalho’s “Aprenda a Programar” (Learn to Program)</a>.
        </p>

        <p>
            At that time my brother used to work in a local newspaper called Gazeta
            Corumbaense creating ads and layouts when an opportunity appeared to
            develop a website for one of the clients. My brother designed the webpage and
            I programmed it in DreamWeaver.
        </p>

        <p>
            At the time I didn't knew PHP programming, so I asked a friend to help me with the
            code for the contact form and then I decided to research and learn to program
            in PHP.
        </p>

        <p>
            It's been <strong>{{ years }} years</strong> since then. 
            <strong>AND NOW I'M BALD!</strong>
        </p>

    </v-container>
        
    <CTA></CTA>    

</GuestLayout>
</template>

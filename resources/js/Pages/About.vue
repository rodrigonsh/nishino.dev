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

        <p lang="pt">Oi! Sou Rodrigo, tenho {{ age }} anos, Desenvolvedor FullStack e pai da Sofia ❤️. Moro em Campo Grande/MS - Brasil</p>
        <p lang="en">Hi! I’m Rodrigo, {{ age }} years, FullStack Developer and Sofia’s father ❤️. I live in Campo Grande / MS - Brazil</p>
        <p lang="es">¡Hola! Soy Rodrigo, {{ age }} años, FullStack Developer y padre de Sofia ❤️. Vivo en Campo Grande / MS - Brasil</p>


        <p lang="pt">Comecei meus primeiros passos em direção ao design em 1994 aprendendo Corel Draw. Eu desenhava e imprimia cartões de visita em Campo Limpo Paulista/SP.</p>
        <p lang="en">
            I began my firsts steps towards design in 1994 learning Corel
            Draw. I used to draw and print business cards in Campo Limpo
            Paulista / SP.
        </p>
        <p lang="es">Mis primeros pasos hacia Design los comencé en 1994 aprendiendo Corel Draw. Solía dibujar e imprimir tarjetas de visita en Campo Limpo Paulista / SP.</p>


        <p lang="pt">
            Em 2001, quando cursava Biologia na UFMS em Corumbá/MS tive acesso ao laboratório 
            de informática com internet gratuita e resolvi aprender programação em Python 
            através do <a href="https://github.com/ramalho/aprendaprog" target="_blank">“Aprenda a Programar” de Luciano Ramalho.</a>
        </p>
        <p lang="en">
            In 2001, when I was studying Biology at UFMS in Corumbá / MS I had access to
            the computer lab with free internet and I decided to learn programming in
            Python through <a href="https://github.com/ramalho/aprendaprog" target="_blank">
                Luciano Ramalho’s “Aprenda a Programar” (Learn to Program)</a>.
        </p>
        <p lang="es">En 2001, cuando estudiaba Biología en la UFMS de Corumbá / MS tuve acceso al 
            laboratorio de computación con internet gratis y decidí aprender a programar en Python a 
            través del programa <a href="https://github.com/ramalho/aprendaprog" target="_blank">“Aprenda a Programar” de Luciano Ramalho.</a>
        </p>

        <p lang="pt">
            Naquela época <a target="_blank" href="https://estudioeureka.com.br/">meu irmão</a>
            trabalhava em um jornal local chamado Gazeta
            Corumbaense criando anúncios e layouts quando surgiu uma oportunidade para
            desenvolver um site para um dos clientes. Meu irmão desenhou a página e
            eu programei no DreamWeaver.
        </p>
        <p lang="en">
            At that time <a target="_blank" href="https://estudioeureka.com.br/">my brother</a> 
            used to work in a local newspaper called Gazeta
            Corumbaense creating ads and layouts when an opportunity appeared to
            develop a website for one of the clients. My brother designed the webpage and
            I programmed it in DreamWeaver.
        </p>
        <p lang="es">
            En aquella época <a target="_blank" href="https://estudioeureka.com.br/">mi hermano</a> 
            trabajaba en un periódico local llamado Gazeta
            Corumbaense creando anuncios y maquetaciones cuando apareció la oportunidad para 
            desarrollar un sitio web para uno de los clientes. Mi hermano diseñó la página web y
            yo la programé en DreamWeaver.
        </p>


        <p lang="pt">
            Na época eu não conhecia programação PHP, então pedi a 
            <a target="_blank" href="https://www.linkedin.com/in/marcos-balca%C3%A7ar-371b3a51/">um amigo</a>
            que me ajudasse com o código do formulário de contato e então 
            resolvi pesquisar e aprender a programar em PHP.
        </p>
        <p lang="en">
            At the time I didn't knew PHP programming, so I asked 
            <a target="_blank" href="https://www.linkedin.com/in/marcos-balca%C3%A7ar-371b3a51/">a friend</a> 
            to help me with the
            code for the contact form and then I decided to research and learn to program
            in PHP.
        </p>
        <p lang="es">
            En ese momento no sabía programación PHP, así que le pedí a 
            <a target="_blank" href="https://www.linkedin.com/in/marcos-balca%C3%A7ar-371b3a51/">un amigo</a>
             que me 
            ayudara con el código del formulario de contacto y entonces decidí investigar y 
            aprender a programar en PHP.
        </p>


        <p lang="pt">
            Já se passaram <strong>{{ years }} anos</strong> desde então.
            <strong>E AGORA ESTOU CARECA!</strong>
        </p>
        <p lang="en">
            It's been <strong>{{ years }} years</strong> since then. 
            <strong>AND NOW I'M BALD!</strong>
        </p>
        <p lang="es">
            Han pasado <strong>{{ years }} años</strong> desde entonces.
            <strong>¡Y AHORA ESTOY CALVO!</strong>
        </p>


        <img class="w-100" src="/img/sofia.jpg" />
        
    </v-container>
        
    <CTA></CTA>    

</GuestLayout>
</template>

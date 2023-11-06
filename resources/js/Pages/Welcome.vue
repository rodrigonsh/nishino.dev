<script setup>

    import {Head, Link, useForm} from '@inertiajs/vue3';
    import InputRules from "@/Shared/rules"

    import GuestLayout from '@/Layouts/GuestLayout.vue';

    import VueTypewriterEffect from "vue-typewriter-effect";

    import { computed, ref } from 'vue'

    import { useAppStore } from './../store.js'
    const store = useAppStore()

    const props = defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        laravelVersion: String,
        phpVersion: String,
        status: String,
        projetos: Array
    });

    const rules = InputRules

    const form = useForm({
        search: ''
    });

    var lang = ref(store.lang)

    const arquivoFrases = [
        {
            'pt': "Crie um site profissional e de alta qualidade.",
            'en': "Create a professional and high-quality website.",
            "es": "Crea un sitio web profesional y de alta calidad."
        },
        {
            'pt': "Transforme sua presença online com nosso design personalizado.",
            'en': "Transform your online presence with our custom design.",
            "es": "Transforma tu presencia en línea con nuestro diseño personalizado."
        },
        {
            'pt': "Desenvolvimento de sites eficientes e acessíveis.",
            'en': "Development of efficient and accessible websites.",
            "es": "Desarrollo de sitios web eficientes y accesibles."
        },
        {
            'pt': "Websites personalizados para o seu negócio.",
            'en': "Custom websites for your business.",
            "es": "Sitios web personalizados para tu negocio."
        },
        {
            'pt': "Criamos sites exclusivos para alcançar seus objetivos.",
            'en': "We create unique websites to achieve your goals.",
            "es": "Creamos sitios web exclusivos para alcanzar tus objetivos."
        },
        {
            'pt': "Desenvolvimento web com resultados surpreendentes.",
            'en': "Web development with amazing results.",
            "es": "Desarrollo web con resultados sorprendentes."
        },
        {
            'pt': "Combinando experiência com AI pelos melhores resultados.",
            'en': "Combining AI expertise for the best results.",
            "es": "Combinando experiencia en IA para obtener los mejores resultados"
        },
    ]

    const translatedPhrases = computed( function() {

        console.log('ue, translatedPhrases', store.lang)

        let res = []

        arquivoFrases.forEach( function(item)
        {
            res.push( item[store.lang] )
        })

        return res
    })



</script>


<template>
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <div v-if="store.prevLang == store.lang" class="typewriter">
            <vue-typewriter-effect
                deleteSpeed="0"
                delay="50"
                :strings="translatedPhrases" 
            />   

            <img src="/img/logo-nsh-white.svg" id="hero-logo" />

        </div>

        <v-container id="features">

            <v-row>

                <v-col md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="blue" icon="mdi-code-braces-box" class="feat-icon" size="64"></v-icon>
                        <h2>Frontend</h2>
                        <p>Vue, Ionic, Cordova, Firebase, SASS, jQuery</p>
                    </v-sheet>

                </v-col>

                <v-col  md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="green" icon="mdi-database-outline" class="feat-icon" size="64"></v-icon>
                        <h2>Backend</h2>
                        <p>Laravel, Code Igniter, Docker, cPanel, SSH, MySQL, Apache</p>
                    </v-sheet>

                </v-col>

                <v-col  md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="red" icon="mdi-lifebuoy" class="feat-icon" size="64"></v-icon>
                        <h2>Consultoria</h2>
                        <p>Team Leader, Manutenção de Sistema Legado, Pair Programming</p>
                    </v-sheet>

                </v-col>

            </v-row>

            
        </v-container>

        <v-container>

            <div id="cta" class="mt-4">
                
                <h1>Vamos construir o projeto dos seus sonhos?</h1>
                <p>
                    Vai montar um website? App? Vamos marcar uma reunião
                    e viabilizar sua ideia
                </p>

                <p>
                    Desenvolvimento: <strong>US$ 50,00 por hora</strong> <br />
                    Consultoria: <strong>US$ 30,00 por hora</strong>
                </p>

                <div class='d-flex justify-md-end justify-sm-end justify-center'>
                <Link href="/contato" >
                    <v-btn prepend-icon="mdi-message" size="large">Entrar em contato</v-btn>
                </Link>
                </div>
            </div>

        </v-container>

        
        
</GuestLayout>

</template>

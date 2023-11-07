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
            'pt': "Desenvolvimento de sites eficientes e acessíveis.",
            'en': "Development of efficient and accessible websites.",
            "es": "Desarrollo de sitios web eficientes y accesibles."
        },
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

        let res = []

        arquivoFrases.forEach( function(item)
        {
            res.push( item[store.lang] )
        })

        return res
    })



</script>


<template>

    <Head title="Welcome" />
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <div class="typewriter">
            <vue-typewriter-effect
                v-if="store.prevLang == store.lang"
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
                        <p>Vue, Ionic, Cordova, Firebase, SASS, jQuery, Bootstrap</p>

                        <Link href="/frontend" >
                            <v-btn lang="pt" variant="outlined">Saiba mais</v-btn>
                            <v-btn lang="en" variant="outlined">Know More</v-btn>
                            <v-btn lang="es" variant="outlined">Sepa Más</v-btn>
                        </Link>

                    </v-sheet>

                </v-col>

                <v-col  md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="green" icon="mdi-database-outline" class="feat-icon" size="64"></v-icon>
                        <h2>Backend</h2>
                        <p>Laravel, Code Igniter, Docker, cPanel, SSH, MySQL, Apache</p>

                        <Link href="/backend" >
                            <v-btn lang="pt" variant="outlined">Saiba mais</v-btn>
                            <v-btn lang="en" variant="outlined">Know More</v-btn>
                            <v-btn lang="es" variant="outlined">Sepa Más</v-btn>
                        </Link>

                    </v-sheet>

                </v-col>

                <v-col  md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="red" icon="mdi-lifebuoy" class="feat-icon" size="64"></v-icon>
                        <h2 lang="pt">Consultoria</h2>
                        <h2 lang="en">Consulting</h2>
                        <h2 lang="es">Consultoría</h2>

                        <p lang="pt">Team Leader, Manutenção de Sistema Legado, Pair Programming</p>
                        <p lang="en">Team Leader, Legacy Systems Maintenance, Pair Programming</p>
                        <p lang="es">Team Leader, Manutención de Sistema Heredado, Programación en pareja</p>

                        <Link href="/consultoria" >
                            <v-btn lang="pt" variant="outlined">Saiba mais</v-btn>
                            <v-btn lang="en" variant="outlined">Know More</v-btn>
                            <v-btn lang="es" variant="outlined">Sepa Más</v-btn>
                        </Link>

                    </v-sheet>

                </v-col>

            </v-row>

            
        </v-container>


        <v-container id="projetos">

            <Link :href="route('projeto', {slug: 'diarionline'})">
            <v-card class='projeto'>

                <v-row>

                    <v-col md="3" cols="12" class="proj-img" style="background-image: url(/img/slide-diario.jpg);" ></v-col>

                    <v-col md="8" cols="12">

                        <div class="descr">

                        <h1>Diário Corumbaense</h1>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>

                        <v-chip class="mr-1">PHP</v-chip>
                        <v-chip class="mr-1">SCSS</v-chip>
                        <v-chip class="mr-1">200K+ Visitors</v-chip>
                        <v-chip class="mr-1">Main Developer</v-chip>

                        </div>

                    </v-col>

                </v-row>
                
            </v-card>
            </Link>

            <v-card class="projeto">
                Vitrine Virtual
            </v-card>

            <v-card>
                Show de Prêmios
            </v-card>

            <v-card>
                Domicílio Digital
            </v-card>

        </v-container>

        <v-container>

            <div id="cta" class="mt-4">
                
                <h1 lang="pt">Vamos construir o projeto dos seus sonhos!</h1>
                <h1 lang="en">Lets build the project of your dreams!</h1>
                <h1 lang="es">¡Construyamos el proyecto de tus sueños!</h1>

                <p lang="pt">
                    Vai montar um website? App? Vamos marcar uma reunião
                    e viabilizar sua ideia
                </p>

                <p lang="en">
                    ¿Vas a montar un sitio web? ¿Aplicación? Organicemos una reunión
                     y hacer viable tu idea
                </p>

                <p lang="es">
                    Are you going to set up a website? App? Let's set up a meeting
                     and make your idea viable
                </p>

                <p lang="pt">
                    Desenvolvimento: <strong>US$ 50,00 / hora</strong> <br />
                    Consultoria: <strong>US$ 30,00 por hora</strong>
                </p>

                <p lang="es">
                    Desarollo: <strong>US$ 50,00 / hora</strong> <br />
                    Consultoría: <strong>US$ 30,00 por hora</strong>
                </p>

                <p lang="en">
                    Development: <strong>US$ 50,00 / hour</strong> <br />
                    Consulting: <strong>US$ 30,00 / hour</strong>
                </p>

                <div class='d-flex justify-md-end justify-sm-end justify-center'>
                <Link href="/contato" >
                    <v-btn lang="pt" prepend-icon="mdi-message" size="large">Entrar em contato</v-btn>
                    <v-btn lang="en" prepend-icon="mdi-message" size="large">Get in touch</v-btn>
                    <v-btn lang="es" prepend-icon="mdi-message" size="large">Cuenta conmigo</v-btn>
                </Link>
                </div>
            </div>

        </v-container>

        
        
</GuestLayout>

</template>

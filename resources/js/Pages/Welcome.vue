<script setup>

    import {Head, Link, useForm} from '@inertiajs/vue3';
    import InputRules from "@/Shared/rules"

    import GuestLayout from '@/Layouts/GuestLayout.vue';
    import CTA from '@/Components/CTA.vue';

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

    const getBgStyle = function(proj)
    {
        return "background-image: url(/storage/"+proj.cover+")"
    }
    
    const getChips = function(proj)
    {
        return proj.chips.split(', ')
    }


</script>


<template>

    <Head title="Welcome" />
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <CTA></CTA>

        <v-container id="features">

            <v-row>

                <v-col  md='4' cols="12">

                    <v-sheet class="pa-4 text-center" elevation="1">
                        <v-icon color="red" icon="mdi-lifebuoy" class="feat-icon" size="64"></v-icon>
                        <h2 lang="pt">Consultoria</h2>
                        <h2 lang="en">Consultancy</h2>
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

                

            </v-row>

            
        </v-container>


        <v-container id="projetos">

            
            <Link v-for="proj in projetos" :href="route('projeto', {slug: proj.slug})">
            <v-card class='projeto'>

                <v-row>

                    <v-col md="3" cols="12" class="proj-img" :style="getBgStyle(proj)"></v-col>

                    <v-col md="8" cols="12">

                        <div class="descr">

                        <h1>{{ proj.nome }}</h1>

                        <p lang="pt">{{  proj.descricao_pt  }}</p>
                        <p lang="en">{{  proj.descricao_en  }}</p>
                        <p lang="es">{{  proj.descricao_es  }}</p>

                        <v-chip v-for="chip in getChips(proj)" class="ma-1">{{  chip  }}</v-chip>
                        

                        </div>

                    </v-col>

                </v-row>
                
            </v-card>
            </Link>

        </v-container>


        <div class="typewriter">
            <vue-typewriter-effect
                v-if="store.prevLang == store.lang"
                deleteSpeed="0"
                delay="50"
                :strings="translatedPhrases" 
            />   

            <img src="/img/logo-nsh-white.svg" id="hero-logo" />

        </div>

        
        
</GuestLayout>

</template>

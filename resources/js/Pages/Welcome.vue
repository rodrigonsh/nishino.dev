<script setup>

    import {Head, Link, useForm} from '@inertiajs/vue3';
    import InputRules from "@/Shared/rules"

    import GuestLayout from '@/Layouts/GuestLayout.vue';

    import VueTypewriterEffect from "vue-typewriter-effect";
    import VueWordCloud from 'vuewordcloud';

    import { VueperSlides, VueperSlide } from 'vueperslides'
    import 'vueperslides/dist/vueperslides.css'

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

    var currentLangIndex = 0

    const langs = ['pt', 'en', 'es']

    var lang = ref(store.lang)

    const twRef = ref();

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

    const myWords = [
        ['Fullstack', 19], 

        ['Laravel', 16],
        ['PHP', 14],
        ['Javascript', 14],
        ['Code Igniter', 10],
        
        ['App Development', 8],
        ['flutter', 7],
        ['APIs', 8],
        ['Docker', 8],
        ['Cloud Services', 6],
        
        ['SSH', 5],
        ['Cordova', 5],
        ['Onsen.io', 5],
        ['Ionic', 5],
        ['PagSeguro', 4],
        ['cPanel', 4],
        ['Databases', 3],
        ['Apache', 3],
        ['image processing', 2],
        ['Mobile-First Design', 2],
        ['Geoprocessing', 2],
        ]

    const myColors = function([name, weight])
    {
        if (weight > 16) return 'DeepPink';
        if (weight > 10) return '#6200ee';
        if (weight > 6) return '#ab92ce';
        if (weight < 6) return 'LightGray';
        else return 'Indigo';
    }

    const myWeights = function([name, weight])
    {
        if (weight > 10) return 900;
        else return 100;   
    }



    const translatedPhrases = computed( function() {

        console.log('ue, translatedPhrases', store.lang)

        let res = []

        arquivoFrases.forEach( function(item)
        {
            res.push( item[store.lang] )
        })

        return res
    })

    const buscar = () => {
        form.get(route('search', [form.search]));
    }

    const slidesBP = 
    {
        900: {visibleSlides: 2, slideRatio: 1/2 }, // From width = 900px to width = 601.
        600: { visibleSlides: 1, slideRatio: 1 } // From width = 600px to width = 0.
    }

    const oldSlides = [
    {
        title: 'Diário Corumbaense',
        content: 'Portal Jornalístico.',
        image: '/img/slide-diario.jpg'
    },
    {
        title: 'VitrineVirtual',
        content: 'Cobertura fotográfica.',
        image: '/img/slide-vitrine.jpg'
    },
    {
        title: 'Opa21',
        content: 'App para Delivery.',
        image: '/img/slide-opa.jpg'
    },
    {
        title: 'Show de Prêmios',
        content: 'App de Logística',
        image: '/img/slide-sdp.jpg'
    },
    {
        title: 'CaimaSUL',
        content: 'Biometria e Coleta',
        image: '/img/slide-caimasul.jpg'
    },
    {
        title: 'Domicílio Digital',
        content: 'Em Parceria com MultiSIG',
        image: '/img/slide-multisig.jpg'
    }
    ]

    var slides = []

    for( projeto in props.projetos )
    {
        let slide = 
        {
            title: projeto.nome,
            content: projeto.descricao,
            poster: projeto.poster,
            id: projeto.id,
        }
        slides.push( slide ) 
    }

    function teste(hum)
    {
        console.log('teste')
    }


</script>


<template>
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <div v-if="store.prevLang == store.lang" class="typewriter">
            <vue-typewriter-effect
                ref="twRef"
                deleteSpeed="0"
                delay="50"
                :strings="translatedPhrases" 
            />   

            <img src="/img/logo-nsh-white.svg" id="hero-logo" />

        </div>

        <v-container class="h-100">

            <vueper-slides 
                autoplay
                infinite
                slide-ratio="0.3"
                :gap="3"
                :visible-slides="3"
                :breakpoints="slidesBP"
                class="no-shadow"
                >

                <vueper-slide
                    v-for="(slide, i) in slides"
                    :key="i"
                    :title="slide.title"
                    :content="slide.content"
                    :image="slide.image"
                    @click="teste"
                >
                </vueper-slide>
                
            </vueper-slides>

            <div id="cta" class="mt-4">
                
                <h1>Vamos construir o projeto dos seus sonhos?</h1>
                <p>
                    Vai montar um website? App? Vamos marcar uma reunião
                    e viabilizar sua ideia
                </p>

                <div class='d-flex justify-md-end justify-sm-end justify-center'>
                <Link href="/contato" >
                    <v-btn prepend-icon="mdi-message" size="large">Entrar em contato</v-btn>
                </Link>
                </div>
            </div>


            <vue-word-cloud
                class="w-100 h-25"
                :words="myWords"
                :color="myColors"
                :font-weight="myWeights"
                spacing="0.2"
                font-family="Ubuntu"
            />

            
        </v-container>

        
        
</GuestLayout>

</template>

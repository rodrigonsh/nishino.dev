<script setup>

    import {Head, Link, useForm} from '@inertiajs/vue3';

    import GuestLayout from '@/Layouts/GuestLayout.vue';

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
        projeto: Array
    });


    const slides = [
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


</script>


<template>
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <vueper-slides 
                autoplay
                infinite
                slide-ratio="0.4"
                :gap="3"
                :visible-slides="1"
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

        <v-container>

            <div class="descr">

<h1>Diário Corumbaense</h1>

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>

<v-chip class="mr-1">PHP</v-chip>
<v-chip class="mr-1">SCSS</v-chip>
<v-chip class="mr-1">200K+ Visitors</v-chip>
<v-chip class="mr-1">Main Developer</v-chip>

</div>


            
        </v-container>

        
        
</GuestLayout>

</template>

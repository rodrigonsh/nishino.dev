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
    
        <v-container>

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

            
        </v-container>

        
        
</GuestLayout>

</template>

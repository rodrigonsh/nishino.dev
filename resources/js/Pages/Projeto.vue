<script setup>

    import GuestLayout from '@/Layouts/GuestLayout.vue';
    import CTA from '@/Components/CTA.vue';

    import { VueperSlides, VueperSlide } from 'vueperslides'
    import 'vueperslides/dist/vueperslides.css'

    import { computed } from 'vue'

    const props = defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        laravelVersion: String,
        phpVersion: String,
        status: String,
        projeto: Array
    });

    const getChips = function(proj)
    {
        return proj.chips.split(', ')
    }

    
    const slides = computed( function()
    {
        
        let ret = []
        
        let galeria = JSON.parse(props.projeto.galeria)

        for( var i=0; i < galeria.length; i++ )
        {
            ret.push({ image: '/storage/' + galeria[i] })
        }

        return ret

    } )


</script>


<template>
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="NISHINO">
    
        <v-container>

            <div class="descr">

                <h1 class='mb-3'>{{ projeto.nome }}</h1>

                <p>
                    Cliente: <strong>{{ projeto.cliente }}</strong><br />
                    Data: <strong>{{ projeto.data }}</strong>
                </p>

                <p lang="pt">{{  projeto.descricao_pt  }}</p>
                <p lang="en">{{  projeto.descricao_en  }}</p>
                <p lang="es">{{  projeto.descricao_es  }}</p>

                <v-chip v-for="chip in getChips(projeto)" class="ma-1">{{  chip  }}</v-chip>

                <a v-if="projeto.site" target="_blak" :href="projeto.site">
                    <v-btn class='d-block mt-5 bg-primary text-white"'>{{ projeto.site }}</v-btn>
                </a>

                <vueper-slides 
                autoplay
                infinite
                slide-ratio="0.565"
                :visible-slides="1"
                :breakpoints="slidesBP"
                class="no-shadow my-6"
                slide-image-inside
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

                <h2 class="mt-5">Mais sobre</h2>

                <p lang="pt" v-html="projeto.estoria_pt"></p>
                <p lang="en" v-html="projeto.estoria_en"></p>
                <p lang="es" v-html="projeto.estoria_es"></p>


            </div>


            
        </v-container>

        
        
</GuestLayout>

</template>

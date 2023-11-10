<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';
import InputRules from "@/Shared/rules"
import GuestLayout from '@/Layouts/GuestLayout.vue';
import Swal from 'sweetalert2'
import { computed } from 'vue'

import { useAppStore } from './../store.js'
const store = useAppStore()


defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String
});

const years = new Date().getFullYear() - 2001

var form = useForm({
    cta: null,
    whatsapp: null,
    email: null,
    name: null,
    address: null,
    body: null,
    orcamento: null,
});

const randIdx = Math.floor(Math.random() * 2)

const getCTA = computed(function()
{

    
    let ctas = 
    [
        {
            'pt': 'Transforme seu objetivo em realidade com o poder do desenvolvimento fullstack',
            'en': 'Turn your goal into reality with the power of fullstack development',
            'es': 'Convierta su objetivo en realidad con el poder del desarrollo fullstack',
        },
        {
            'pt': 'Construa seu futuro com um desenvolvedor fullstack com experiência',
            'en': 'Build your future with an experienced fullstack developer',
            'es': 'Construya su futuro con un desarrollador fullstack experimentado',
        }
    ]

    return ctas[randIdx][store.lang]
})

const getLabel = function(field)
{   
    let labels = 
    {
        'nome': {
            'pt': 'Nome',
            'en': 'Name',
            'es': 'Nombre',
        },
        'endereco': {
            'pt': 'Endereço',
            'en': 'Address',
            'es': 'Ubicación',
        },
        'body': {
            'pt': 'Descreva o Projeto',
            'en': 'Project Description',
            'es': 'Descripción del Proyecto',
        },
        'orcamento': {
            'pt': 'Orçamento',
            'en': 'Budget',
            'es': 'Presupuesto',
        },
        'submit': {
            'pt': 'Enviar',
            'en': 'Submit',
            'es': 'Dale',
        },
    }

    return labels[field][store.lang]
}

const getSuccessData = function(field)
{
    let labels = 
    {
        'title': {
            'pt': 'Mensagem Recebida!',
            'en': 'Message received!',
            'es': '¡Mensaje recibido!',
        },
        'text': {
            'pt': 'Vamos retornar o contato o mais rápido possível',
            'en': 'We will get back in touch as soon as possible',
            'es': 'Nos pondremos en contacto lo antes posible.',
        },
        'confirmButtonText': {
            'pt': 'Maravilha',
            'en': 'Cool',
            'es': '¡Genial!',
        },

        'error_title': {
            'pt': 'Erro!',
            'en': 'Error!',
            'es': '¡Erro!',
        },
        'error_text': {
            'pt': 'Vamos retornar o contato o mais rápido possível',
            'en': 'We will get back in touch as soon as possible',
            'es': 'Nos pondremos en contacto lo antes posible.',
        },
    }

    return labels[field][store.lang]
}

const enviar = () => {
    console.log('opA!')
    form.post(route('enviar', form), {
        onSuccess: (response) => {

            console.log(response)
            
            if ( response.status == 200 )
            {
                Swal.fire({
                    title: getSuccessData('title'),
                    text: getSuccessData('text'),
                    icon: 'success',
                    confirmButtonText: getSuccessData('confirmButtonText')
                    })

                return
            }

        },
        onError: () => {

            Swal.fire({
                title: getSuccessData('title_error'),
                text: getSuccessData('text_error'),
                icon: 'error',
                confirmButtonText: 'OK'
                })       
        },
    });
}

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Entre em Contato">
    
    <Head title="Fale conosco" />

    <v-container class="h-100">

        <form @submit.prevent="enviar()" id="contato" class="pa-4">

            <h2 class="mb-4" v-html="getCTA"></h2>

            <input type="hidden" name="cta" :value="getCTA">

            <p lang="pt">
                Ao analisar suas experiências e necessidades específicas, 
                enviarei uma proposta de valor atraente adaptada à sua realidade
            </p>
            <p lang="en">
                By analyzing your specific experiences and needs,
                I will send you an attractive value proposal adapted to your reality
            </p>
            <p lang="es">
                Al analizar sus experiencias y necesidades específicas,
                Te enviaré una propuesta de valor atractiva y adaptada a tu realidad.
            </p>

            <v-text-field 
                prepend-inner-icon="mdi-account" 
                v-model="form.name" 
                :label="getLabel('nome')" 
                :rules="[InputRules.required]"
                required 
            />
            
            <v-text-field 
                prepend-inner-icon="mdi-at" 
                v-model="form.email" 
                label="Email" 
                :rules="[InputRules.required, InputRules.email]"
                required 
            />

            <v-text-field 
                prepend-inner-icon="mdi-whatsapp" 
                v-model="form.whatsapp" 
                label="Whatsapp" 
                :rules="[InputRules.required]"
                required 
            />


            
            <v-textarea 
            prepend-inner-icon="mdi-map" 
            v-model="form.address" 
            :label="getLabel('endereco')" 
            />
            
            <v-textarea 
                prepend-inner-icon="mdi-map" 
                v-model="form.body" 
                :label="getLabel('body')" 
            />
            
            <v-select 
                prepend-inner-icon="mdi-currency-usd" 
                v-model="form.orcamento" 
                :label="getLabel('orcamento')" 
                :items="['Até 10.000', 'Até 50.000', 'Acima de 50.000']"
            />

            <div class="d-flex justify-end">
            <v-btn
                type="submit"
                append-icon="mdi-chevron-right"
                color="primary"
                >{{ getLabel('submit') }}</v-btn>
            </div>


        </form>

    </v-container>
        
        
</GuestLayout>
</template>

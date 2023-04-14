<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';
import InputRules from "@/Shared/rules"
import GuestLayout from '@/Layouts/GuestLayout.vue';
import Swal from 'sweetalert2'


defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String
});

const years = new Date().getFullYear() - 2001

var form = useForm({
    email: null,
    whatsapp: null,
    name: null,
    state: null,
    city: null,
    orcamento: null
});

const enviar = () => {
    console.log('opA!')
    form.post(route('enviar', form), {
        onSuccess: () => {
            Swal.fire({
                title: 'Mensagem Recebida!',
                text: 'Vamos retornar o contato o mais rápido possível',
                icon: 'success',
                confirmButtonText: 'Cool'
                })
        }
    });
}

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Entre em Contato">
    
    <Head title="Fale conosco" />

    <v-container class="h-100">

        <form @submit.prevent="enviar()" id="contato" class="pa-4">

            <h2 class="mb-4">Vamos realizar seu sonho!</h2>

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

            <v-text-field 
                prepend-inner-icon="mdi-account" 
                v-model="form.name" 
                label="Nome" 
                :rules="[InputRules.required]"
                required 
            />

            <v-text-field 
                prepend-inner-icon="mdi-map" 
                v-model="form.state" 
                label="Estado" 
            />

            <v-text-field 
                prepend-inner-icon="mdi-map-marker" 
                v-model="form.city" 
                label="Cidade" 
            />

            <v-text-field 
                prepend-inner-icon="mdi-currency-usd" 
                v-model="form.budget" 
                label="Orçamento" 
            />

            <div class="d-flex justify-end">
            <v-btn
                type="submit"
                append-icon="mdi-chevron-right"
                color="primary"
                >Enviar</v-btn>
            </div>


        </form>

    </v-container>
        
        
</GuestLayout>
</template>

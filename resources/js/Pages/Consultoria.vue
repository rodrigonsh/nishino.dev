<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Consultoria">
    
    <Head title="Consultoria" />

    <v-container >

        <h1>Consultoria</h1>

        <p>Falar sobre ser lider de equipe</p>
        <p>Falar sobre pair programming</p>
        <p>Suporte a sistemas legados</p>

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3';
import GuestLayout from '@/Layouts/GuestLayout.vue';

const props = defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});
</script>

<template>
    <Head title="TODOKE Project" />
    
    <GuestLayout :canLogin="canRegister" :canRegister="canRegister" title="TODOKE">
        <v-container class="my-12">
            <v-row>
                <v-col cols="12" md="6">
                    <h1 class="text-h3 mb-6">TODOKE</h1>
                    <p class="text-h6 mb-4">Revolucionando o sistema de delivery com tecnologia open-source</p>
                    
                    <p class="mb-4">O TODOKE é uma plataforma inovadora de gerenciamento de entregas desenvolvida pela NISHINO LTDA, projetada especificamente para motoboys e operações com drones.</p>

                    <p class="mb-4">Nosso sistema foi desenvolvido para otimizar rotas, reduzir custos operacionais e melhorar a experiência tanto para entregadores quanto para clientes finais.</p>

                    <v-btn
                        href="https://github.com/rodrigonsh/todoke"
                        target="_blank"
                        color="primary"
                        size="large"
                        class="mt-4"
                    >
                        <v-icon icon="mdi-github" class="mr-2"></v-icon>
                        Conheça no GitHub
                    </v-btn>
                </v-col>

                <v-col cols="12" md="6">
                    <v-img
                        src="/img/slide-diario.jpg"
                        cover
                        class="rounded-lg"
                        height="300"
                    ></v-img>
                </v-col>
            </v-row>

            <v-row class="mt-8">
                <v-col cols="12">
                    <h2 class="text-h4 mb-4">Principais Recursos</h2>
                    
                    <v-list lines="two">
                        <v-list-item
                            v-for="feature in [
                                'Arquitetura distribuída e federada',
                                'Integração pioneira com drones',
                                'Algoritmos de otimização de rotas',
                                'Modelo de assinatura acessível',
                                'Funcionalidades offline',
                                'Conformidade com LGPD'
                            ]"
                            :key="feature"
                            :title="feature"
                        >
                            <template v-slot:prepend>
                                <v-icon color="primary" icon="mdi-check-circle"></v-icon>
                            </template>
                        </v-list-item>
                    </v-list>
                </v-col>
            </v-row>
        </v-container>
    </GuestLayout>
</template>

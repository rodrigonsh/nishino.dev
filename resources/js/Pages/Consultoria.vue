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

        <h1 class="mb-6" lang="pt">Consultoria</h1>
        <h1 class="mb-6" lang="en">IT Consultancy</h1>
        <h1 class="mb-6" lang="es">Consultoría</h1>

        <p>
            Se sua empresa está procurando por um consultor em TI com 
            experiência em liderança, suporte a desenvolvedores e suporte a sistemas legados, 
            eu sou a pessoa certa para você. Posso ajudá-lo a:
        </p>

        <ul class="my-6">
            <li>Aumentar a produtividade da sua equipe de desenvolvimento</li>
            <li>Melhorar a qualidade do seu código analisando <strong>PRs</strong> e enforçanco o <strong>CodeStyle</strong> da sua empresa</li>
            <li>Reduzir os custos de manutenção previnindo publicação de bugs em produção</li>
            <li>Garantir a segurança dos seus sistemas, tanto com NDAs como com meus <strong>contatos em CyberSecurity</strong></li>
        </ul>

        <h2>Experiência em liderança</h2>

        <p>
            Com mais de 20 anos de experiência na área de TI, tenho vasta experiência 
            em liderança de equipes. Já liderei equipes de diversos tamanhos e 
            com diferentes níveis de experiência, sempre com excelência e segurança. 
        </p>

        <p>
            Posso ajudar a melhorar a comunicação e a colaboração entre os desenvolvedores. 
            Bem como desenvolver processos e ferramentas que ajudem a melhorar a eficiência da equipe.
        </p>
            
        <p>
            Sou um líder reflexivo, analítico e lógico. Penso bastante a respeito
            das situações antes de agir e procuro sempre uma solução adequada.
        </p>

        <p>Respeitar e extrair o melhor de cada membro da equipe é essencial</p>

        <h2 class="my-6">Suporte a desenvolvedores</h2>

        <p>
            Além de liderar equipes, também tenho experiência em dar suporte a 
            outros desenvolvedores. Sou proficiente em calls online e pair programming, 
            e posso ajudar os desenvolvedores a mitigar bugs inexplicáveis, problemas técnicos, 
        </p>
        
        <p>
            Ajudá-los a aprender novas tecnologias, melhorar suas habilidades e
            encontrar recursos e informações que os ajudem a fazer seu trabalho
        </p>

        <h2 class="my-6">Suporte a sistemas legados</h2>

        <p>
            Também tenho experiência em dar suporte a sistemas legados. 
            Sou capaz de entender e trabalhar com sistemas complexos e 
            antigos, e posso ajudar as empresas a manter esses sistemas 
            funcionando de forma confiável e segura.
        </p>

        <p>Também posso ajudá-los a modernizar esses sistemas para melhorar seu desempenho e eficiência</p>


    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>

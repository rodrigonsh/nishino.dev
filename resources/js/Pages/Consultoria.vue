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

    <v-container class="longtext">

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
            e posso ajudar os desenvolvedores a mitigar bugs inexplicáveis e outros problemas técnicos.
        </p>
        
        <p>
            Posso ajudá-los a aprender novas tecnologias, sofisticar suas habilidades e
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

        <h2 class="my-6">Levantamento de Requisitos e Gerenciameto de Projeto</h2>

        <p>
            Para criar um projeto que atenda às suas necessidades e expectativas
            é importante que você compartilhe comigo o que você espera desse projeto.
            <strong>Não tenha medo de compartilhar suas ideias, mesmo que elas pareçam 
            pequenas ou irrelevantes. Toda ideia é importante.</strong>
        </p>

        <p>
            Após a etapa de Levantamento de requisitos os seguintes documentos
            podem ser produzidos conforme a complexidade do projeto:
        </p>

        <h3>Termo de Abertura do Projeto (TAP) ou Project Charter:</h3>

        <p>
            É o documento autoriza oficialmente o início do projeto. Ele descreve a finalidade, 
            objetivos, partes interessadas, orçamento inicial e outras informações de 
            alto nível sobre o projeto. O TAP é geralmente desenvolvido pelo patrocinador do projeto.
        </p>
        
        <h3>Plano de Projeto:</h3>

        <p>
            Este é um documento abrangente que descreve como o projeto será executado, 
            monitorado e controlado. Ele inclui informações sobre escopo, cronograma, 
            custos, recursos, riscos e comunicações, entre outros.</p>
        
        <p>
            O plano de projeto serve como um guia para a equipe do projeto durante toda a sua execução.
        </p>

        <h3>Declaração de Escopo do Projeto:</h3>

        <p>
            Define o que está incluído e o que não está incluído no projeto. 
            Ela estabelece os limites do projeto e é usada como referência para garantir 
            que o trabalho do projeto esteja alinhado com os objetivos.
        </p>

        <h3>Estrutura Analítica do Projeto (EAP) ou Work Breakdown Structure (WBS):</h3>

        <p>
            A EAP é uma representação hierárquica de todas as tarefas e atividades do projeto. 
            Ela ajuda a organizar e decompor o escopo do projeto em partes menores e mais gerenciáveis.
        </p>

        <h3>Cronograma do Projeto:</h3>

        <p>
            Este documento apresenta uma sequência detalhada de todas as atividades 
            do projeto, suas durações e as interdependências entre elas.
        </p>
        
        <p>
            Geralmente é representado em forma de <strong>gráfico de Gantt</strong> ou usando software de g
            erenciamento de projetos.
        </p>


        <h3>Orçamento do Projeto:</h3>

        <p>
            O orçamento do projeto detalha os custos associados ao projeto, incluindo recursos, 
            materiais, mão de obra e outros gastos. Ele é uma parte crítica do planejamento 
            financeiro e controle do projeto.
        </p>

        <h3>Plano de Comunicação do Projeto:</h3>

        <p>
            Define como as informações serão comunicadas dentro da equipe do 
            projeto e para as partes interessadas externas. 
            Inclui a identificação das mensagens, os destinatários, os métodos de comunicação e a frequência.
        </p>

        <h3>Plano de Gerenciamento de Riscos:</h3>

        <p>
            Este documento identifica, avalia e descreve como os riscos do 
            projeto serão gerenciados. Ele inclui estratégias para 
            mitigação, contingência e resposta a riscos.
        </p>

        <h3>Relatórios de Status do Projeto:</h3>

        <p>
            São documentos periódicos que informam o progresso do projeto em 
            relação ao plano. Eles geralmente incluem informações sobre o escopo, 
            cronograma, custo e riscos do projeto.
        </p>

        <h3>Documentação de Encerramento do Projeto:</h3>

        <p>
            Após a conclusão do projeto, esta documentação inclui lições 
            aprendidas, relatórios finais, documentação de aceitação do cliente e 
            outros registros relevantes. Ajuda a encerrar o projeto de forma organizada.
        </p>

        <p>
            Suas ideias são valiosas para mim. Elas podem ajudar a tornar o projeto mais 
            completo, eficiente e eficaz.
        </p>

        <p>
            Acredito que o sucesso de um projeto depende da colaboração entre todos os envolvidos. 
            Por isso, estou sempre aberto a ouvir suas ideias e sugestões.
        </p>

        


        <p>
            
        </p>

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>


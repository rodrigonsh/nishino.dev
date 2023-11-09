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

        <p lang="pt">
            Se sua empresa está procurando por um consultor em TI com 
            experiência em liderança, suporte a desenvolvedores e suporte a sistemas legados, 
            eu sou a pessoa certa para você. Posso ajudá-lo a:
        </p>
        <p lang="en">
             If your company is looking for an IT consultant with
             experience in leadership, developer support and legacy systems support,
             I am the right person for you. I can help you:
         </p>
        <p lang="es">
             Si su empresa busca un consultor TI con
             experiencia en liderazgo, soporte a desarrolladores y soporte a sistemas heredados,
             Soy la persona adecuada para ti. Puedo ayudarle:
        </p>

        <ul class="my-6">

            <li lang="pt">Aumentar a produtividade da sua equipe de desenvolvimento</li>
            <li lang="en">Increase the productivity of your development team</li>
            <li lang="es">Incrementar la productividad de tu equipo de desarrollo</li>
            
            <li lang="pt">Melhorar a qualidade do seu código analisando <strong>PRs</strong> e cumprindo o <strong>CodeStyle</strong> da sua empresa</li>
            <li lang="en">Improve the quality of your code by analyzing <strong>PRs</strong> and enforcing your company's <strong>CodeStyle</strong></li>
            <li lang="es">Mejorar la calidad de su código analizando los <strong>PRs</strong> y haciendo cumplir el <strong>CodeStyle</strong> de su empresa.</li>
            
            <li lang="pt">Reduzir os custos de manutenção prevenindo publicação de bugs em produção</li>
            <li lang="en">Reduce maintenance costs by preventing bugs from being published in production</li>
            <li lang="es">Reducir los costos de mantenimiento al evitar que se publiquen errores en producción.</li>
            
            <li lang="pt">Garantir a segurança dos seus sistemas, tanto com NDAs como com meus <strong>contatos em CyberSecurity</strong></li>
            <li lang="en">Ensure the security of your systems, both with NDAs and with my <strong>CyberSecurity contacts</strong></li>
            <li lang="es">Garantizar la seguridad de tus sistemas, tanto con NDAs como con mis <strong>contactos de CiberSeguridad</strong></li>

        </ul>

        <h2 lang="pt">Experiência em liderança</h2>
        <h2 lang="en">Leadership experience</h2>
        <h2 lang="es">Experiencia en liderazgo</h2>

        <p lang="pt">
            Com mais de 20 anos de experiência na área de TI, tenho vasta experiência 
            em liderança de equipes. Já liderei equipes de diversos tamanhos e 
            com diferentes níveis de experiência, sempre com excelência e segurança. 
        </p>
        <p lang="en">
            With more than 20 years of experience in the IT field, I have extensive experience
            in team leadership. I have led teams of different sizes and
            with different levels of experience, always with excellence and safety.
        </p>
        <p lang="es">
            Con más de 20 años de experiencia en el campo TI, cuento con amplia experiencia
            en el liderazgo de equipos. He liderado equipos de diferentes tamaños y
            con diferentes niveles de experiencia, siempre con excelencia y seguridad.
        </p>


        <p lang="pt">
            Posso ajudar a melhorar a comunicação e a colaboração entre os desenvolvedores. 
            Bem como desenvolver processos e ferramentas que ajudem a melhorar a eficiência da equipe.
        </p>
        <p lang="en">
            I can help improve communication and collaboration between developers.
            As well as developing processes and tools that help improve team efficiency.
        </p>
        <p lang="es">
            Puedo ayudar a mejorar la comunicación y la colaboración entre desarrolladores.
            Así como desarrollar procesos y herramientas que ayuden a mejorar la eficiencia del equipo.
        </p>
            
        <p lang="pt">
            Sou um líder reflexivo, analítico e lógico. Penso bastante a respeito
            das situações antes de agir e procuro sempre uma solução adequada.
        </p>
        <p lang="en">
            I am a reflective, analytical and logical leader. I think a lot
            about the situation before acting and I always look for an appropriate solution.
        </p>
        <p lang="es">
            Soy un líder reflexivo, analítico y lógico. Lo pienso mucho
            en situaciones antes de actuar y siempre busco una solución adecuada.
        </p>

        <p lang="pt">Respeitar e extrair o melhor de cada membro da equipe é essencial</p>
        <p lang="en">Respecting and extracting the best from each team member is essential</p>
        <p lang="es">Respetar y extraer lo mejor de cada miembro del equipo es fundamental</p>

        <h2 lang="pt" class="my-6">Suporte a desenvolvedores</h2>
        <h2 lang="en" class="my-6">Developer support</h2>
        <h2 lang="es" class="my-6">Soporte para desarrolladores</h2>

        <p lang="pt">
            Além de liderar equipes, também tenho experiência em dar suporte a 
            outros desenvolvedores. Sou proficiente em calls online e pair programming, 
            e posso ajudar os desenvolvedores a mitigar bugs inexplicáveis e outros problemas técnicos.
        </p>
        <p lang="en">
            In addition to leading teams, I also have experience supporting
            other developers. I am proficient in online calls and pair programming,
            and I can help developers mitigate unexplained bugs and other technical issues.
        </p>
        <p lang="es">
            Además de liderar equipos, también tengo experiencia apoyando
            otros desarrolladores. Soy competente en llamadas en línea y programación en pareja,
            y puedo ayudar a tus desarrolladores a mitigar errores inexplicables y otros problemas técnicos.
        </p>
        
        <p lang="pt">
            Posso ajudá-los a aprender novas tecnologias, sofisticar suas habilidades e
            encontrar recursos e informações que os ajudem a fazer seu trabalho
        </p>
        <p lang="en">
            I can help them learn new technologies, refine their skills and
            find resources and information that help them do their work
        </p>
        <p lang="es">
            Puedo ayudarlos a aprender nuevas tecnologías, perfeccionar sus habilidades y
            encontrar recursos e informaciones que les ayuden a hacer su trabajo
        </p>

        <h2 lang="pt" class="my-6">Suporte a sistemas legados</h2>
        <h2 lang="en" class="my-6">Support for legacy systems</h2>
        <h2 lang="es" class="my-6">Soporte para sistemas heredados</h2>

        <p lang="pt">
            Também tenho experiência em dar suporte a sistemas legados. 
            Sou capaz de entender e trabalhar com sistemas complexos e 
            antigos, e posso ajudar sua empresa a manter esses sistemas 
            funcionando de forma confiável e segura.
        </p>
        <p lang="en">
            I also have experience supporting legacy systems.
            I am able to understand and work with complex and
            old systems, and I can help your company to maintain these systems
            operating reliably and safely.
        </p>
        <p lang="es">
            También tengo experiencia en soporte de sistemas heredados.
            Soy capaz de comprender y trabajar con sistemas complejos y
            antiguos y puedo ayudar tuya compania a mantener estos sistemas
            operando de manera confiable y segura.
        </p>

        <p lang="pt">Também posso ajudá-los a modernizar esses sistemas para melhorar seu desempenho e eficiência.</p>
        <p lang="en">I can also help you modernize these systems to improve their performance and efficiency.</p>
        <p lang="es">También puedo ayudarlos a modernizar estos sistemas para mejorar su rendimiento y eficiencia.</p>

        <h2 lang="pt" class="my-6">Levantamento de Requisitos e Gerenciamento de Projeto</h2>
        <h2 lang="en" class="my-6">Requirements Gathering and Project Management</h2>
        <h2 lang="es" class="my-6">Recopilación de requisitos y gestión de proyectos.</h2>

        <p lang="pt">
            Para criar um projeto que atenda às suas necessidades e expectativas
            é importante que você compartilhe comigo o que você espera desse projeto.
            <strong>Não tenha medo de compartilhar suas ideias, mesmo que elas pareçam 
            pequenas ou irrelevantes. Toda ideia é importante.</strong>
        </p>
        <p lang="en">
            To create a project that meets your needs and expectations
             It's important that you share with me what you expect from this project.
             <strong>Don't be afraid to share your ideas, even if they seem small or 
            irrelevant. Every idea is important.</strong>
        </p>
        <p lang="es">
            Para crear un proyecto que satisfaga sus necesidades y expectativas.
             Es importante que compartas conmigo lo que esperas de este proyecto.
             <strong>No tengas miedo de compartir tus ideas, incluso si parecen 
            pequeñas o irrelevantes. Cada idea es importante.</strong>
        </p>


        <p lang="pt">
            Após a etapa de Levantamento de requisitos, os seguintes documentos
            podem ser produzidos conforme a complexidade do projeto:
        </p>
        <p lang="en">
            After the requirements gathering stage, the following documents
            can be produced depending on the complexity of the project:
        </p>
        <p lang="es">
            Luego de la etapa de recolección de requisitos, los siguientes documentos
            se puede producir dependiendo de la complejidad del proyecto:
        </p>

        <h3 lang="pt">Termo de Abertura do Projeto (TAP) ou Project Charter:</h3>
        <h3 lang="en">Project Charter:</h3>
        <h3 lang="es">Término de Apertura del Proyecto (TAP)</h3>

        <p lang="pt">
            É o documento que autoriza oficialmente o início do projeto. Ele descreve a finalidade, 
            objetivos, partes interessadas, orçamento inicial e outras informações de 
            alto nível sobre o projeto. O TAP é geralmente desenvolvido pelo patrocinador do projeto.
        </p>
        <p lang="en">
            This is the document that officially authorizes the start of the project. It describes the purpose,
            objectives, stakeholders, initial budget, and other high-level information about the project. 
            This document is generally developed by the project sponsor.
        </p>
        <p lang="es">
            Este es el documento que autoriza oficialmente el inicio del proyecto. Describe el propósito,
            objetivos, partes interesadas, presupuesto inicial y otras informaciónes de 
            alto nivel sobre el proyecto. El TAP generalmente lo desarrolla el patrocinador del proyecto.
        </p>
        
        <h3 lang="pt">Plano de Projeto:</h3>
        <h3 lang="en">Project Plan:</h3>
        <h3 lang="es">Plan de Proyecto:</h3>

        <p lang="pt">
            Este é um documento abrangente que descreve como o projeto será executado, 
            monitorado e controlado. Ele inclui informações sobre escopo, cronograma, 
            custos, recursos, riscos e comunicações, entre outros.
        </p>
        <p lang="en">
            This is a comprehensive document that describes how the project will be carried out,
            monitored and controlled. It includes information about scope, schedule,
            costs, resources, risks and communications, among others.
        </p>
        <p lang="es">
            Este es un documento completo que describe cómo se llevará a cabo el proyecto,
            monitoreado y controlado. Incluye información sobre alcance, cronograma,
            costos, recursos, riesgos y comunicaciones, entre otros.
        </p>


        <p lang="pt">O plano de projeto serve como um guia para a equipe do projeto durante toda a sua execução.</p>
        <p lang="en">The project plan serves as a guide for the project team throughout its execution.</p>
        <p lang="es">El plan del proyecto sirve como guía para el equipo del proyecto durante su ejecución.</p>

        <h3 lang="pt">Declaração de Escopo do Projeto:</h3>
        <h3 lang="en">Project Scope Statement:</h3>
        <h3 lang="es">Enunciado del alcance del proyecto:</h3>

        <p lang="pt">
            Define o que está incluído e o que não está incluído no projeto. 
            Ela estabelece os limites do projeto e é usada como referência para garantir 
            que o trabalho do projeto esteja alinhado com os objetivos.
        </p>
        <p lang="en">
            Defines what is included and what is not included in the project.
            It establishes project boundaries and is used as a reference to ensure
            that project work is aligned with objectives.
        </p>
        <p lang="es">
            Define lo que se incluye y lo que no se incluye en el proyecto.
            Establece los límites del proyecto y se utiliza como referencia para garantizar
            que el trabajo del proyecto esté alineado con los objetivos.
        </p>

        <h3 lang="pt">Estrutura Analítica do Projeto (EAP):</h3>
        <h3 lang="en">Work Breakdown Structure (WBS):</h3>
        <h3 lang="es">Estructura de Desglose del Trabajo (EDT):</h3>

        <p lang="pt">
            A EAP é uma representação hierárquica de todas as tarefas e atividades do projeto. 
            Ela ajuda a organizar e decompor o escopo do projeto em partes menores e mais gerenciáveis.
        </p>
        <p lang="en">
            The WBS is a hierarchical representation of all project tasks and activities.
            It helps organize and break down the project scope into smaller, more manageable parts.
        </p>
        <p lang="es">
            La EDT es una representación jerárquica de todas las tareas y actividades del proyecto.
            Ayuda a organizar y dividir el alcance del proyecto en partes más pequeñas y manejables.
        </p>

        <h3 lang="pt">Cronograma do Projeto:</h3>
        <h3 lang="en">Project Schedule:</h3>
        <h3 lang="es">Cronograma del proyecto:</h3>

        <p lang="pt">
            Este documento apresenta uma sequência detalhada de todas as atividades 
            do projeto, suas durações e as interdependências entre elas.
        </p>
        <p lang="en">
            This document presents a detailed sequence of all activities
            of the project, its durations and the interdependencies between them.
        </p>
        <p lang="es">
            Este documento presenta una secuencia detallada de todas las actividades
            del proyecto, sus duraciones y las interdependencias entre ellas.
        </p>
        
        <p lang="pt">
            Geralmente é representado em forma de <strong>gráfico de Gantt</strong> ou usando seu
            software de gerenciamento de projetos.
        </p>
        <p lang="en">
            It is usually represented in the form of a <strong>Gantt chart</strong> or by using 
            your preferred project management software.
        </p>
        <p lang="es">
            Suele representarse en forma de <strong>diagrama de Gantt</strong> o mediante 
            el software de gestión de proyectos que haya eligido.
        </p>



        <h3 lang="pt">Orçamento do Projeto:</h3>
        <h3 lang="en">Project Budget:</h3>
        <h3 lang="es">Presupuesto del proyecto:</h3>

        <p lang="pt">
            O orçamento do projeto detalha os custos associados ao projeto, incluindo recursos, 
            materiais, mão de obra e outros gastos. Ele é uma parte crítica do planejamento 
            financeiro e controle do projeto.
        </p>
        <p lang="en">
            The project budget details the costs associated with the project, including resources,
            materials, labor and other expenses. It is a critical part of financial 
            planning and project control.
        </p>
        <p lang="es">
            El presupuesto del proyecto detalla los costos asociados con el proyecto, incluidos los recursos,
            materiales, mano de obra y otros gastos. Es una parte crítica de la planificación financiera 
            y el control del proyecto.
        </p>

        <h3 lang="pt">Plano de Comunicação do Projeto:</h3>
        <h3 lang="en">Project Communication Plan:</h3>
        <h3 lang="es">Plan de Comunicación del Proyecto:</h3>

        <p lang="pt">
            Define como as informações serão comunicadas dentro da equipe do 
            projeto e para as partes interessadas externas. 
            Inclui a identificação das mensagens, os destinatários, os métodos de comunicação e a frequência.
        </p>
        <p lang="en">
            Defines how information will be communicated within the project's team
            and external stakeholders.
            Includes identification of messages, recipients, communication methods and frequency.
        </p>
        <p lang="es">
            Define cómo se comunicará la información dentro de la equipo del proyecto
            y partes interesadas externas.
            Incluye identificación de mensajes, destinatarios, métodos de comunicación y frecuencia.
        </p>

        <h3 lang="pt">Plano de Gerenciamento de Riscos:</h3>
        <h3 lang="en">Risk Management Plan:</h3>
        <h3 lang="es">Plan de gestión de Riesgos:</h3>

        <p lang="pt">
            Este documento identifica, avalia e descreve como os riscos do 
            projeto serão gerenciados. Ele inclui estratégias para 
            mitigação, contingência e resposta a riscos.
        </p>
        <p lang="en">
            This document identifies, assesses and describes how project 
            risks will be managed. It includes strategies for risk 
            mitigation, contingency and response.
        </p>
        <p lang="es">
            Este documento identifica, evalúa y describe cómo se gestionarán 
            los riesgos del proyecto. Incluye estrategias de mitigación de 
            riesgos, contingencia y respuesta.
        </p>

        <h3 lang="pt">Relatórios de Status do Projeto:</h3>
        <h3 lang="en">Project Status Reports:</h3>
        <h3 lang="es">Informes de estado del proyecto:</h3>

        <p lang="pt">
            São documentos periódicos que informam o progresso do projeto em 
            relação ao plano. Eles geralmente incluem informações sobre o escopo, 
            cronograma, custo e riscos do projeto.
        </p>
        <p lang="en">
            These are periodic documents that report the project's 
            progress against the plan. They typically include information about 
            the project's scope, schedule, cost, and risks.
        </p>
        <p lang="es">
            Estos son documentos periódicos que informan el progreso del proyecto 
            contra el plan. Por lo general, incluyen información sobre el alcance, 
            el cronograma, el costo y los riesgos del proyecto.
        </p>

        <h3 lang="pt">Documentação de Encerramento do Projeto:</h3>
        <h3 lang="en">Project Closing Documentation:</h3>
        <h3 lang="es">Documentación de cierre del proyecto:</h3>

        <p lang="pt">
            Após a conclusão do projeto, esta documentação inclui lições 
            aprendidas, relatórios finais, documentação de aceitação do cliente e 
            outros registros relevantes. Ajuda a encerrar o projeto de forma organizada.
        </p>
        <p lang="en">
            After project completion, this documentation includes lessons
            learned, final reports, customer acceptance documentation and
            other relevant records. It helps to close the project in an organized way.
        </p>
        <p lang="es">
            Una vez finalizado el proyecto, esta documentación incluye lecciones
            aprendidas, informes finales, documentación de aceptación del cliente y
            otros registros relevantes. Ayuda a cerrar el proyecto de forma organizada.
        </p>

        <p lang="pt">
            Suas ideias são valiosas para mim. Elas podem ajudar a tornar o projeto mais 
            completo, eficiente e eficaz.
        </p>
        <p lang="en">
            Your ideas are valuable to me. They can help make the project more 
            complete, efficient and effective.
        </p>
        <p lang="es">
            Tus ideas son valiosas para mí. Pueden ayudar a que el proyecto sea más 
            completo, eficiente y eficaz.
        </p>

        <p lang="pt">
            Acredito que o sucesso de um projeto depende da colaboração entre todos os envolvidos. 
            Por isso, estou sempre aberto a ouvir suas ideias e sugestões.
        </p>
        <p lang="en">
            I believe that the success of a project depends on collaboration between everyone involved.
            Therefore, I am always open to hearing your ideas and suggestions.
        </p>
        <p lang="es">
            Creo que el éxito de un proyecto depende de la colaboración entre todos los involucrados.
            Por lo tanto, siempre estoy abierto a escuchar sus ideas y sugerencias.
        </p>

    

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>


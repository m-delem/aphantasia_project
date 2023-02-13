---
output:
  pdf_document:
    toc: yes
    toc_depth: 3
    number_sections: yes
    extra_dependencies: ["float","amsmath"]
    keep_md: yes
    keep_tex: yes
    fig_height: 8
    fig_width: 10
    df_print: kable
    includes:
      in_header: "z_preamble.tex"
      before_body: "z_beforebody.tex"
lang: "fr"
langid: french
fontsize: 12pt
linestretch: 1.5
geometry: margin=1in
indent: yes
documentclass: article
bibliography: references.bib
csl: apa.csl
link-citations: yes
---

\newpage





<!-- Le manuscrit est divisé en plusieurs documents pour faciliter les modifications locales - ceux-ci sont dans le dossier du Drive. L'output complet du R Markdown (le pdf final) est en pdf dans le Drive, avec le même nom que ce fichier. Les GDoc de ce Drive servent à éditer le texte rédigé du document final : le code R sous-jacent et les analyses des données seront partagées et travaillées sur GitHub, lié localement à RStudio. Le repository GitHub en question : https://github.com/m-delem/aphantasia_project.git -->


<!-- Tous les tests de formatage -->
Test pour référencer des figures, ici la  \autoref{correlation_matrix}, ou encore la \autoref{k_means}.

Test d'affichage de l'équation d'un modèle hyper stylé qu'on va construire :

\begin{equation}
\label{eq: Modèle 1}
\operatorname{mpg} = \alpha + \beta_{1}(\operatorname{cyl}) + \beta_{2}(\operatorname{disp}) + \epsilon
\end{equation}
Ou encore de l'équation de la transformation des scores qu'ont utilisé Dawes et al. [-@dawesInnerVisionsMind2022] :
$$
y = \frac{x - (S.min + \frac{S.max -S.min}{2})}{S.max-S.min}
$$
... C'est magnifique.
Et est-ce qu'il y aurait moyen de faire une mention de l'hyper-stylé \hyperref[eq: Modèle 1]{Modèle~\ref*{eq: Modèle 1}} décrit plus haut ? Oui !

Test pour référencer des sections : ici on va envoyer vers la section *\nameref{imagerie-visuelle-et-aphantasie}*, puis vers la sous-section *\nameref{questionnaires}*. Pile ce dont on a besoin !

Bon. Dernière étape. Des liens vers chaque référence individuellement...
Par exemple [@bainbridgeQuantifyingAphantasiaDrawing2021]. Ca marche ?       
.      
.       
.     
Malheureusement oui... Ca a pris trois - littéralement **trois** heures à écrire et échouer à faire fonctionner du LaTeX dans les sous-fichiers, pour au final découvrir dans la documentation de Pandoc (que le Cookbook disait être *essentielle* à lire, et que bien sûr j'ai pas lu)... Qu'il fallait ajouter une ligne au YAML, `link-citations: yes`. Envie de caner.     
Mais bon, on a réussi, youpi ! Ouais, ouais... *tocard*... 




\newpage
<!-- Introduction -->

# Introduction

## Imagerie visuelle et aphantasie

L'imagerie visuelle, parfois désignée poétiquement comme le fait de "voir dans les yeux de l'esprit", désigne l'expérience visuelle quasi-perceptive d'images mentales en l'absence du stimulus externe correspondant [@monzelAphantasiaDysikonesiaAnauralia2022; @pearsonHumanImaginationCognitive2019]. L'imagerie visuelle est considérée par la plupart des gens comme un élément central de leur vie mentale quotidienne, dans la mémorisation et la récupération d'informations sur des lieux, des objets ou des personnes connus, dans le vagabondage mental et la rêverie, voire plus généralement dans la créativité [@zemanLivesImageryCongenital2015]. Il a été démontré qu'elle joue un rôle prépondérant dans de nombreux processus cognitifs, tels que la mémoire autobiographique, la mémoire épisodique et la prospection d’évènements futurs [@greenbergRoleVisualImagery2014], la mémoire de travail visuelle [@pearsonHumanImaginationCognitive2019].

Cependant, il a été démontré qu'il pouvait exister une grande variabilité interindividuelle dans l'imagerie visuelle, et que certaines personnes pouvaient même en être totalement dépourvues. L'une des toutes premières études sur l'imagerie visuelle, une enquête menée par Sir Francis Galton en 1880, a apporté les premiers témoignages de la grande variété de la capacité des gens à produire des images mentales. Son "enquête sur la table du petit-déjeuner" invitait les participants à visualiser leur table du matin et à évaluer "l'illumination, la définition et la coloration" des images mentales qu'ils en avaient. À son grand étonnement, il a découvert que certaines personnes interrogées, parmi lesquelles beaucoup de ses collègues, dans ses termes des "hommes de science", ont protesté que l'imagerie mentale leur était inconnue - tout comme les daltoniens ne pouvaient pas concevoir la nature de la couleur, ces personnes ne pouvaient pas concevoir la nature de l'imagerie mentale [@galtonSTATISTICSMENTALIMAGERY1880].     

Il est intéressant de noter que, bien qu'il y ait eu une résurgence des recherches et des débats sur l'imagerie mentale à la fin du siècle qui a suivi (e.g. @kosslynCognitiveNeuroscienceMental1995; @pylyshynMentalImagerySearch2002; @reisbergIntuitionsIntrospectionsImagery2002), cette condition d'"imagination aveugle" n'a pas suscité beaucoup d'attention. Une exception notable est Faw [-@fawConflictingIntuitionsMay2009], qui a soulevé le fait que les théories des chercheurs sur l'imagerie pourraient être fortement biaisées par leur propre expérience subjective de celle-ci. Il a indiqué que les "non-visualiseurs", ignorés par la recherche jusqu'à présent, pourraient représenter 2 à 3 % des personnes, selon son enquête (*N* = 2500). En 2010, Zeman et al. ont rapporté le cas d'un patient qui a perdu la capacité de produire des images mentales après avoir subi une intervention chirurgicale [@zemanLossImageryPhenomenology2010]. L'article a attiré l'attention du public après un reportage dans le magazine *Discovery* [@zimmerBrainLookDeep2010] : bien qu'il s'agisse apparemment d'imagination aveugle "acquise", l'article a conduit de nombreuses personnes à se reconnaître dans cette condition et à contacter l'équipe pour témoigner de leur expérience, avec la différence importante qu'elles avaient toujours eu cette absence d'imagerie. En décrivant leurs cas, Zeman et al. [-@zemanLivesImageryCongenital2015] ont créé le terme "*aphantasie*" pour décrire l'absence d'imagerie mentale.    

L'aphantasie, en tant que terme et phénomène, a attiré l'attention des médias et a entraîné une augmentation importante du nombre de personnes signalant leur cas d'imagerie extrême [@monzelAphantasiaDysikonesiaAnauralia2022]. Les études à grande échelle sur les extrêmes de l'imagerie visuelle suggèrent une prévalence de 2-4% d'aphantasie dans la population générale (@dancePrevalenceAphantasiaImagery2022 : *N* = 1004 ; @dawesCognitiveProfileMultisensory2020 : *N* = 715 ; @fawConflictingIntuitionsMay2009 : *N* = 2500 ; @palermoCongenitalLackExtraordinary2022 : *N* = 490 ; @takahashiDiversityAphantasiaRevealed2022: *N* = 2885 ; @zemanPhantasiaPsychologicalSignificance2020) avec de nombreuses variations (entre 0,5 et 11%) selon les seuils choisis pour caractériser l'affection. L'étude de l'aphantasie est récente, et bien qu'il n'existe pas actuellement de " profil " clairement défini des individus aphantasiques, la recherche a lentement assemblé plusieurs caractéristiques associées à cette condition. 

## Les corrélats de l'aphantasie

Depuis 2015, le nouveau champ scientifique de l'aphantasie a construit un corpus de divers corrélats cognitifs, comportementaux et physiologiques de l'aphantasie. Communément, l'aphantasie est évaluée dans des études à grande échelle en utilisant des auto-rapports qualitatifs et le questionnaire Vividness of Visual Imagery [@marksVividnessVisualImagery1973], même si le seuil VVIQ choisi pour caractériser les personnes ayant une faible imagerie varie selon les études (entre 16 ~ 30). En utilisant les questionnaires comme point de départ, plusieurs études expérimentales ont été en mesure de corréler une faible imagerie visuelle avec des caractéristiques distinctes. 

### Corrélats cognitifs

La plupart des études à grande échelle existantes sur l'aphantasie ont porté sur les capacités de mémoire des aphantasiques, et ont montré des corrélations entre leur faible imagerie et des déficiences en mémoire autobiographique et épisodique [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les aphantasiques, lorsqu'on leur demande d'évaluer leur mémoire autobiographique, l'évaluent le plus souvent plus bas que les témoins [@zemanLivesImageryCongenital2015; @zemanPhantasiaPsychologicalSignificance2020]. L'un de ces rapports subjectifs a fait émerger la possibilité d'une association de l'aphantasie avec les syndromes de mémoire autobiographique sévèrement déficiente [@watkinsPhantasiaSeverelyDeficient2018]. En accord avec les auto-rapports et les données neuropsychologiques sur la mémoire épisodique, Dawes et al. [-@dawesInnerVisionsMind2022] ont démontré, à l'aide de l'Autobiographical Interview, une mesure comportementale de la spécificité et de la richesse des détails épisodiques (combinant donc des évaluations subjectives et objectives) que l'aphantasie était également associée à une réduction des détails épisodiques pour les évènements passés et futurs. Leurs résultats sont également en accord avec ceux de Milton et al. [-@miltonBehavioralNeuralSignatures2021] qui ont mis en évidence une réduction de l'"imagination" temporelle et atemporelle, à savoir la capacité à simuler des évènements fictifs. L'aphantasie a également été associée à la prosopagnosie - la difficulté à reconnaître les visages [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021; @palermoCongenitalLackExtraordinary2022; @zemanPhantasiaPsychologicalSignificance2020], et à des rêves nocturnes et diurnes qualitativement appauvris [@dawesCognitiveProfileMultisensory2020; @zemanPhantasiaPsychologicalSignificance2020].

### Corrélats comportementaux et physiologiques

Comme nous l'avons mentionné, la plupart des études sur l'aphantasie se sont appuyées sur des évaluations subjectives, des questionnaires et des rapports personnels pour identifier et évaluer la condition et l'imagerie visuelle. Bien que les phénomènes subjectifs rapportés par les aphantasiques montrent une cohérence remarquable, les rapports à la première personne et l'introspection restent faillibles [@miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les différences dans les jugements d'imagerie visuelle pourraient être liées à une mauvaise métacognition, résultant en une incapacité des aphantasiques à percevoir consciemment leur imagerie potentiellement effective. Pour surmonter cette limitation, de nouvelles méthodes de mesure de l'imagerie visuelle et de son absence ont été développées afin de trianguler ces auto-rapports subjectifs avec des marqueurs comportementaux et physiologiques objectifs. Ainsi, il a été démontré que les personnes atteintes d'aphantasie ne présentent pas d'amorçage par l'imagerie visuelle par rapport aux témoins en utilisant le paradigme de rivalité binoculaire basé sur les sens [@keoghAttentionDrivenPhantom2020; @keoghBlindMindNo2018] ; elles se souviennent de moins d'objets et de couleurs que les témoins à partir de scènes étudiées [@bainbridgeQuantifyingAphantasiaDrawing2021] ; ils ont montré moins de sensibilité sensorielle dans une tâche d'éblouissement de motifs visuels, ce qui suggère que l'imagerie sensorielle et la sensibilité sensorielle sont liées [@danceLessSensoryOverwhelm2022; @danceWhatLinkMental2021] ; ils n'ont pas montré de réponse de conductivité cutanée à l'imagerie émotionnelle lors de la lecture de scénarios effrayants (Wicken et al., 2019) ; et enfin, ils n'ont pas montré de réponse pupillaire à des formes claires ou sombres imaginées [@lachlanPupillaryLightResponse2022]. Ces deux derniers paradigmes en particulier ont établi les premiers indices physiologiques de la force de l'imagerie sensorielle et phénoménologique, et les premières validations physiologiques de l'aphantasie. L'investigation du phénomène de l'imagerie visuelle par ces méthodes objectives a permis de rassembler des preuves solides en faveur de la conception de l'aphantasie comme une véritable absence (ou une réduction sévère) de l'imagerie visuelle plutôt que comme un déficit métacognitif.

### L'aphantasie est elle un trouble ?

L'aphantasie a été associée dans la littérature récente à une série de déficiences et de déficits, et est donc souvent logiquement désignée comme un handicap ou un trouble (e.g. @blomkvistAphantasiaSearchTheory2022; @fox-muratonWorldImaginationConsequences2021) ; certaines revues vont jusqu'à caractériser la condition comme un ensemble de déficiences résultant d'un dysfonctionnement d'un système cognitif [@blomkvistAphantasiaSearchTheory2022]. Bien que ce point de vue puisse être justifié d'une certaine manière si l'on considère que les déficiences de l'imagerie mentale peuvent survenir à la suite de lésions cérébrales, d'opérations chirurgicales ou de troubles psychiatriques - une condition appelée "aphantasie acquise" [@bartolomeoAssessingCausalRole2020; @cavedon-taylorPredictiveProcessingPerception2021; @farahCaseStudyMental1988; @spagnaChapterVisualMental2022; @zagoCharcotBernardCase2011; @zemanLossImageryPhenomenology2010], on peut trouver à redire sur plusieurs observations dans l'aphantasie congénitale (c'est-à-dire à vie). Des preuves empiriques provenant de plusieurs études soulignent que les aphantasiques pourraient n'avoir aucune différence de performance dans divers types de tâches présumées nécessiter une imagerie visuelle.     

Tout d'abord, en contraste frappant avec les résultats suggestifs sur la mémoire épisodique, les aphantasiques ont des performances aussi précises que les témoins dans plusieurs paradigmes de mémoire de travail visuelle en laboratoire et en clinique [@keoghVisualWorkingMemory2021; @knightMemoryImageryNo2022] ; ils ont également les mêmes performances dans les tâches de mémoire clinique évaluant le rappel antérograde [@miltonBehavioralNeuralSignatures2021] et la mémoire de reconnaissance pour le matériel verbal et visuel [@bainbridgeQuantifyingAphantasiaDrawing2021; @miltonBehavioralNeuralSignatures2021] ; ils ne présentent pas de différences significatives dans les tâches de mémoire sémantique [@dawesCognitiveProfileMultisensory2020; @miltonBehavioralNeuralSignatures2021] ; de même, ils ne présentent pas de déficience de la mémoire déclarative générale ou visuelle dans une batterie de tests neuropsychologiques [@pounderOnlyMinimalDifferences2022]. Keogh et al. [-@keoghVisualWorkingMemory2021] soulignent également dans leur étude le fait que les performances des aphantasiques dans les tâches d'imagerie visuelle peuvent s'appuyer sur des stratégies différentes, sur la base des différences notables entre leurs stratégies rapportées, et corroborées par une absence d'effet d'orientation dans leurs réponses, supposé se produire en raison du recrutement sensoriel.      

Pris ensemble, ces résultats suggèrent que les aphantasiques ne présentent pas de problèmes de mémoire de travail, de reconnaissance ou de mémoire déclarative (générale ou visuelle) qui pourraient s'avérer affecter leur vie quotidienne. Ils reflètent également le fait que ces performances pourraient s'appuyer sur des stratégies alternatives non visuelles tout aussi adaptées pour résoudre des problèmes supposés auparavant nécessiter une imagerie visuelle. Ceci plaide pour considérer que les aphantasiques utilisent des approches alternatives qui pourraient ne pas être uniquement de la compensation, mais un tout autre " mode de fonctionnement humain du traitement de l'information " [@zemanPhantasiaPsychologicalSignificance2020] : si nous adhérons à ce point de vue, les spécificités des différences entre ces modes restent encore à déterminer. 

### Expériences de vie et "styles cognitifs"

En accord avec le fait que leur vie quotidienne ne semble pas être affectée par leur état, les aphantasiques sont le plus souvent inconscients de leur état, qui est de la même manière invisible pour les gens, puisqu'ils ne vivent apparemment pas différemment de n'importe qui d'autre [@kendleAphantasiaExperiencesPerceptions2017; @zemanLivesImageryCongenital2015]. Bien qu'il n'existe pas, à ce jour, d'étude systématique du profil démographique des aphantasiques, les résultats préliminaires d'une étude récente [@zemanPhantasiaPsychologicalSignificance2020] apportent un éclairage sur les préférences professionnelles potentielles des personnes dotées d'imageries extrêmes. En effet, les données des questionnaires de milliers de participants sur l'imagerie visuelle ont révélé que les extrêmes de ce spectre présentaient des associations comportementales et psychologiques distinctes, y compris des préférences professionnelles : alors que les personnes présentant une imagerie visuelle extrêmement élevée (appelées "hyperphantasiques") avaient tendance à travailler dans des professions traditionnellement considérées comme "créatives" (à savoir les arts, le design, le divertissement et la communication), les aphantasiques étaient plus susceptibles de travailler dans l'informatique, les mathématiques et les sciences [@crowderDifferencesSpatialVisualization2018; @zemanPhantasiaPsychologicalSignificance2020]. Ces résultats apportent un autre argument, d'un point de vue comportemental plus large, vers l'idée d'une tension entre deux "styles cognitifs" [@kozhevnikovSpatialObjectVisualizers2005], et une vision de l'aphantasie et de l'hyperphantasie comme des conditions équilibrées, avec des avantages et des inconvénients [@zemanPhantasiaPsychologicalSignificance2020].       

Bien que les affirmations initiales de Galton selon lesquelles les "hommes de science" manquaient d'imagerie mentale aient été contestées depuis et qu'il ait été démontré qu'il s'agissait d'une extension excessive de son observation de quelques répondants particulièrement inhabituels parmi ses collègues scientifiques [@brewerScientistsAreNot2006], son récit reste intéressant d'un point de vue opposé : Si les aphantasiques sont effectivement très peu nombreux, comme l'ont montré des données plus récentes, ont-ils vraiment tendance à se tourner vers les domaines scientifiques ? Les premiers résultats concernant les aphantasiques semblent corroborer cette intuition. Pourtant, quelles bases cognitives pourraient sous-tendre ces différentes stratégies mentales des aphantasiques et ces apparentes affinités intellectuelles ? Quelle est la nature des différents "modes" supposés de traitement de l'information visuelle ?

## La disctinction entre imagerie visuelle-objet et visuospatiale

Une hypothèse est que cette dualité reposerait sur la distinction fondamentale, dans l'imagerie visuelle, entre deux composantes, l'imagerie visuelle-objet (c'est-à-dire la représentation mentale des caractéristiques visuelles d'un objet telles que la forme, la luminosité ou la couleur) et l'imagerie visuelle-spatiale (c'est-à-dire la représentation mentale des emplacements spatiaux et des relations entre les parties d'un objet).

### Voies ventrales et dorsales dans la perception et l'imagerie visuelle

La distinction entre le traitement des objets et le traitement spatial a d'abord été introduite pour la perception visuelle [@mishkinContributionStriateInputs1982], puis proposée pour la mémoire de travail visuelle [@dellasalaPatternSpanTool1999; @salwayVisuospatialWorkingMemory1995]. Il a été démontré que le traitement visuel de plus haut niveau est divisé en deux voies distinctes sur le plan fonctionnel et anatomique : la voie ventrale, qui va du lobe occipital au lobe temporal inférieur et qui traite les propriétés des objets (couleurs, forme, luminosité), et la voie dorsale, qui va du lobe occipital au lobe pariétal postérieur et qui traite les propriétés spatiales. Sur la base de données comportementales, neuropsychologiques et de neuroimagerie [@blajenkovaObjectspatialImageryNew2006; @bocciaPennyYourThoughts2015; @kozhevnikovRevisingVisualizerVerbalizerDimension2002; @kozhevnikovSpatialObjectVisualizers2005; @mortonImageTransformationDissociated1995; @palermoCongenitalLackExtraordinary2022], une distinction objet-spatial similaire a été suggérée pour l'imagerie visuelle. Ce contexte théorique a conduit au développement et à la validation d'un questionnaire permettant d'évaluer ces deux aspects de l'imagerie visuelle, l'Object and Spatial Imagery Questionnaire (OSIQ : @blajenkovaObjectspatialImageryNew2006).

### L'imagerie objet et spatiale chez les aphantasiques

Dans ce cadre, cette distinction entre imagerie objet et imagerie spatiale pourrait être centrale pour la compréhension de l'aphantasie : les cas étudiés jusqu'à présent sont-ils dépourvus d'imagerie visuelle objet, spatiale ou les deux ? Un résultat expérimental remarquablement cohérent dans toutes les études récentes sur l'aphantasie est l'imagerie spatiale préservée des aphantasiques, par opposition à leur imagerie d'objet altérée. En utilisant l'OSIQ, plusieurs études ont montré qu'il n'y avait pas de différence significative entre les aphantasiques et les témoins sur les items d'imagerie spatiale [@bainbridgeQuantifyingAphantasiaDrawing2021; @dawesCognitiveProfileMultisensory2020; @keoghBlindMindNo2018; @miltonBehavioralNeuralSignatures2021; @zemanPhantasiaPsychologicalSignificance2020]. Les aphantasiques ont obtenu des résultats précis au test des mannequins et aux tâches de rotation mentale, impliquant la rotation mentale d'avatars ou d'objets [@crowderDifferencesSpatialVisualization2018; @miltonBehavioralNeuralSignatures2021; @pounderOnlyMinimalDifferences2022] - bien que Pounder et al. [-@pounderOnlyMinimalDifferences2022] aient signalé des temps de réponse plus lents pour les aphantasiques à très faible imagerie. Zeman et al. [-@zemanPhantasiaPsychologicalSignificance2020] rapportent que, lorsqu'on leur demande d'imaginer et de compter les fenêtres de leur maison, les personnes ayant une imagerie élevée ou moyenne s'appuient systématiquement sur l'imagerie visuelle, tandis que les aphantasiques utilisent diverses autres stratégies : visualisation ou mémoire spatiale, imagerie alternative (kinesthésique, auditive, etc.), traitement sémantique ou " connaissances " amodales. De même, Bainbridge et al. [-@bainbridgeQuantifyingAphantasiaDrawing2021] ont observé que, lorsqu'on leur demande de dessiner de mémoire une scène vue précédemment, les aphantasiques se souviennent de beaucoup moins d'objets et de façon moins détaillée que les témoins, mais avec des tailles, des emplacements et une organisation corrects, voire plus précis. Ensemble, ces résultats suggèrent que les "aphantasiques" actuellement les plus étudiés sont en fait des aphantasiques "objets", avec une imagerie visuospatiale intacte.       

Ce phénomène pourrait être lié au fait que les individus aphantasiques ont été principalement identifiés à l'aide du VVIQ [@marksVividnessVisualImagery1973], qui est corrélé positivement avec l'échelle objet de l'OSIQ, mais pas avec l'échelle spatiale, ni avec les tâches d'imagerie spatiale [@blajenkovaObjectSpatialImagery2006; @blajenkovaObjectspatialImageryNew2006; @blazhenkovaTwoEyesBlind2019; @blazhenkovaVisualobjectAbilityNew2010]. Le VVIQ permettrait donc de détecter sélectivement les déficiences de l'imagerie visuelle des objets, mais pas de l'espace. À ce titre, Blazhenkova et Pechenkova [-@blazhenkovaTwoEyesBlind2019] ont émis l'hypothèse qu'il pourrait exister deux types d'imagerie extrême (potentiellement congénitale) : l'aphantasie des objets d'une part, et l'aphantasie spatiale d'autre part (et inversement, deux types d'hyperphantasie). Dans une étude récente examinant pour la première fois cette hypothèse de manière systématique, Palermo et al. [-@palermoCongenitalLackExtraordinary2022] ont rassemblé des preuves très prometteuses de l'existence d'aphantasies et d'hyperphantasies objectales et spatiales, en utilisant l'OSIQ et des questionnaires évaluant plusieurs compétences. Elles ont également montré que les deux sous-types d'aphantasie étaient associés à des modèles différents de difficultés cognitives : les aphantasiques "objet", comme nous l'avons vu précédemment, ont montré des difficultés à imaginer des objets et à reconnaître des visages, tandis que les aphantasiques "spatiaux" avaient des problèmes avec les tâches d'imagerie mentale visuospatiale et le sens de la direction - un modèle opposé de performances a été observé pour les deux types d'hyperphantasie. 

### Des styles cognitifs équilibrés entre imagerie objet et spatiale

Ces résultats sur l'imagerie d'objet et spatiale introduisent une deuxième dimension (spatiale) significative dans l'imagerie visuelle et la recherche sur l'aphantasie, qui semble afficher des modèles opposés à la composante (objet) qui a été distinguée dans les études précédentes : avoir ces deux axes permet d'envisager une possibilité pour le profil " équilibré " hypothétique de l'aphantasie, qui pourrait être basé sur un équilibre entre les méthodes de représentation mentale visuelle-objet et visuelle-spatiale.       

Des résultats intéressants dans la littérature sur l'imagerie spatiale semblent faire écho aux premiers résultats de Zeman et al. [-@zemanPhantasiaPsychologicalSignificance2020] sur les préférences professionnelles des aphantasiques (objet). Les hautes performances dans les tests de visualisation spatiale sont corrélées aux performances professionnelles et académiques dans divers domaines STEM, notamment la physique, la chimie organique, la géologie, les mathématiques, ainsi que la chirurgie, l'architecture et le raisonnement mécanique [@colemanSpatialPerceptionSkills1998; @hegartyIndividualDifferencesSpatial2005; @keehnerSpatialAbilityExperience2004; @kozhevnikovSpatialVisualizationPhysics2007; @orionRelationshipEarthScienceEducation1997; @waiSpatialAbilitySTEM2009]. D'autres études ont mis en évidence que la réussite dans les STEM reposait sur des capacités fondamentales d'imagerie spatiale telles que l'imagination de structures schématiques ou l'exécution de transformations spatiales mentales [@kozhevnikovSpatialVisualizationPhysics2007; @waiSpatialAbilitySTEM2009]. Ces considérations jettent également un nouvel éclairage sur les observations et les intuitions de Galton [-@galtonSTATISTICSMENTALIMAGERY1880] concernant les scientifiques. Blajenkova et al. [@blajenkovaObjectSpatialImagery2006] ont proposé une explication avec le clivage objet-spatial : les scientifiques ne seraient pas complètement déficients en imagerie visuelle générale, comme le suggérait Galton, mais seraient seulement sélectivement déficients en imagerie visuelle objet.       

En outre, les recherches sur les différences individuelles en matière d'imagerie ont démontré que les scientifiques et les ingénieurs ont tendance à être des imageurs spatiaux tandis que les artistes visuels ont tendance à être des imageurs objet [@blajenkovaObjectSpatialImagery2006; @blazhenkovaNewObjectspatialverbalCognitive2009; @blazhenkovaVisualobjectAbilityNew2010; @kozhevnikovSpatialObjectVisualizers2005; @kozhevnikovTradeoffObjectSpatial2010]. Ces études ont non seulement montré, par le biais de rapports subjectifs, que les artistes et les scientifiques différaient en termes d'imagerie, mais elles ont également mis en évidence des différences de performance : les artistes ont obtenu de meilleurs résultats dans les tâches nécessitant la visualisation d'objets (par exemple, la création de représentations d'images et de couleurs, l'identification d'objets dégradés) ; tandis que les visualiseurs spatiaux et les scientifiques ont obtenu de meilleurs résultats dans les tâches nécessitant une visualisation spatiale (par exemple, la rotation mentale, le pliage de papier, la recherche d'un emplacement). Enfin, Kozhevnikov et al. [@kozhevnikovCreativityVisualizationAbilities2013] ont constaté que les évaluations de l'imagerie de visualisation d'objets par rapport à celle de visualisation spatiale étaient respectivement et sélectivement associées aux évaluations de créativité artistique par rapport à celle de créativité scientifique. 

### Un "trade-off" entre imagerie objet et spatiale chez les aphantasiques ?

Une question ouverte reste celle du lien potentiel entre l'imagerie visuelle objet et spatiale, et plus particulièrement ici dans les cas d'aphantasie. Les voies ventrales et dorsales régissant ces deux aspects étant connues pour être fonctionnellement et anatomiquement différentes [@mishkinContributionStriateInputs1982], il a longtemps été considéré que les deux processus visuels objet et spatial étaient des composantes mutuellement indépendantes de la représentation et de l'imagerie [@farahCaseStudyMental1988; @mishkinContributionStriateInputs1982]. Néanmoins, Kozhevnikov et al. [@kozhevnikovTradeoffObjectSpatial2010] ont montré, sur cinq groupes d'âge différents et quatre groupes de spécialisation différents, que les artistes visuels avaient des capacités de visualisation d'objets supérieures à la moyenne mais des capacités de visualisation spatiale inférieures à la moyenne, tandis que les scientifiques présentaient le schéma inverse. Aucun des groupes professionnels (artistes, scientifiques, architectes ou spécialistes des sciences humaines) ne présentait à la fois des capacités de visualisation d'objets et des capacités de visualisation spatiale supérieures à la moyenne : il a donc été proposé qu'il pouvait y avoir un compromis entre les capacités de visualisation d'objets et les capacités de visualisation spatiale. Comme l'étude a montré que les scores d'imagerie globale (spatiale + objet) étaient relativement homogènes chez tous les participants, ce compromis impliquerait l'existence d'un "goulot d'étranglement" dans la quantité totale des capacités d'imagerie, qui nécessiterait leur affectation en fonction de l'activité de chacun. Par conséquent, on peut supposer qu'un tel compromis pourrait exister, dans le cas de l'aphantasie, entre les ressources objet et spatiales : les aphantasiques objet, les cas d'aphantasie les plus étudiés, pourraient potentiellement compenser cette imagerie objet réduite par une imagerie spatiale plus vive - une possibilité qui, jusqu'à présent, n'a pas été étudiée en profondeur en raison de l'accent mis sur la composante objet singulière de l'aphantasie.        

La dualité de l'imagerie visuelle entre l'objet et l'espace, l'existence proposée de formes spécifiques d'images extrêmes qui leur sont associées, et la distinction apparente des profils cognitifs entre les visualiseurs "objet" et les visualiseurs "espaces"spatiaux", soutiennent l'hypothèse que les aphantasies soient des conditions équilibrées. Elles pourraient avoir leurs propres avantages et inconvénients qui pourraient être répartis sur plusieurs dimensions : parmi lesquelles le traitement visuel-objet ou visuospatial, mais peut-être aussi le traitement verbal, en accord avec les modèles précédemment développés de styles cognitifs Objet-Spatial-Verbal [@blazhenkovaNewObjectspatialverbalCognitive2009], et comme l'ont supposé Zeman et al. [@zemanPhantasiaPsychologicalSignificance2020].

<!-- Sema

## Stratégies et mécanismes de compensation possibles dans l'aphantasie

	Galton (1880) : Il remarquait déjà que les hommes de science qu'il avait interrogés présentaient des capacités de visualisation plus faibles que la population tout venant. L'explication apportée est la suivante : une forte tendance à percevoir des images mentales claires serait antagoniste à l'acquisition d'habitudes de pensées abstraites et généralisées. Par ailleurs, Galton notait que ces grands esprits qui manquaient d'imagerie mentale pouvaient tout de même donner des descriptions précises de scènes visuelles. Il pensait que cette capacité manquante pouvait être remplacée par d'autres modes de conception, notamment des modes de pensées liés au sens moteur. 
	Zeman et al. (2015) : les aphantasiques pourraient avoir développé des stratégies compensatrices dans les domaines verbaux, mathématiques et logiques
	Zeman et al. (2020) : sur-représentation d'aphantasiques (comparés à un groupe d'hyperphantasiques) dans les professions scientifiques, mathématiques et informatiques. Utilisation de stratégies alternatives pour résoudre la tâche de comptage du nombre de fenêtres chez soi : recours à l'imagerie spatiale non-visuelle, à l'imagerie kinesthésique, et aux connaissances amodales. Il fait l'hypothèse d'un traitement de l'information préférentiellement sémantique et factuel chez les aphantasiques.
	Knauff et Johnson-Laird (2002) : Etude du raisonnement en fonction de la facilité pour construire des modèles mentaux spatiaux. Les 3 expériences montrent que les relations visuelles ralentissent le processus de raisonnement par rapport aux relations spatiales, visuospatiales et contrôles. Ils concluent que les détails visuels sans importance peuvent être gênants pour le raisonnement et donc que cela peut entraver le processus.
	Junichi et Jiro (2020) : étude de cas d'un aphantasique via questionnaires. Le participant présentait des capacités d'imagerie auditive préservée et rapportait avoir recours à une compensation verbale
	Gangczarek et al. (2020) : Etude de cas d'une aphantasique : au questionnaire OSIVQ, la participante présente un score très faible dans la composante "imagerie d'objet" alors que les sous scores spatiaux et verbaux sont dans la norme, témoignant d'une préférence pour le raisonnement spatial et verbal. Malgré son aphantasie, elle présente des scores dans la norme en MDT visuospatiale. Le QIT est élevé (128), avec une différence significative entre le QI verbal et le QI performance, au profit du verbal (138 et 114).
	Milton et al. (2021) : les participants aphantasiques présentent un QI plus élevé que les participants hyperphantasiques (petits échantillons)

	Fonctions exécutives = moyens de compenser des difficultés, de s'adapter, permettant de développer de nouvelles stratégies


## Images mentales et lecture

Hypothèse que la lecture implique des images mentales
	Modèle mental, Johnson-Laird
	Suggate et Lenhard  (2022) : 3 expériences (n = 155, 452 et 236). Les résultats montrent que la mesure objective de l'imagerie mentale visuelle est corrélée avec les performances en lecture, alors que les auto-évaluations subjectives (questionnaires) ne montraient pas de lien avec la lecture. De plus, la compréhension en lecture était plus fortement associée à l'imagerie mentale que la vitesse de lecture. Les résultats montrent donc pour la première fois que les processus d'imagerie mentale sont intrinsèquement liés aux performances en lecture. Autrement dit : l'imagerie mentale mesurée par l'ICT est un prédicteur significatif de la compréhension en lecture (// cognition incarnée, modèle mental)
L'utilisation d'une tâche écologique impliquant les images mentales pourrait être intéressante.
	Magyari et al. (2020) : L'objectif était d'étudier la contribution de l'imagerie mentale dans la lecture de textes littéraires à travers une méthodologie d'eye-tracking. Dans cette expérience, les lecteurs rencontraient plus de difficultés pour produire des images mentales lorsqu'ils lisaient un texte principalement descriptif que lorsqu'ils lisaient un texte principalement énactif (représentations liées à l'action). Des temps de fixation plus longs étaient corrélés au texte énactif. Les auteurs suggèrent que le style énactif mobilise davantage les processus d'imagerie, ce qui se traduirait dans le comportement oculaire des participants.
	Brehm (2011) : rôle essentiel de l'image pour créer du sens, la lecture est comparée à une simulation, simulation à laquelle on a recours quand on se remémore des souvenirs du passé ou à l'imagination du futur (qui est altérée chez les aphantasiques)
"Gilles Thérien, par exemple, souligne très justement que toute lecture littéraire est «un travail d’imagination» et de construction permettant à un sujet «d’investir, dans un mouvement qui va de l’intérieur vers l’extérieur, [s]es images sous les mots du texte"

## Objectif

Pour la plupart des gens, les images mentales sont omniprésentes dans la vie quotidienne. Mais pour certaines personnes, l'expérience de l'imagerie visuelle fait défaut, une condition récemment appelée aphantasie. Les images mentales sont impliquées dans de nombreux processus cognitifs, comme la mémoire autobiographique, l’imagination du futur, la mémoire de travail visuospatiale, la compréhension du langage, le raisonnement moral, ou encore les rêves. A l’inverse on peut imaginer que certaines tâches soient gênées par la création d’images mentales, par exemple des tâches qui nécessitent des représentations plus abstraites, comme la catégorisation ou le raisonnement analogique. Il existe encore très peu d’études qui cherchent à caractériser le profil cognitif des personnes aphantasiques. L’objectif du présent projet est de mesurer les performances des personnes aphantasiques dans différents domaines cognitifs. 
Premièrement il s’agira de mieux comprendre le profil cognitif de ces personnes. Si les images mentales sont un frein au raisonnement abstrait, on peut s’attendre à ce que les personnes aphantasiques soient meilleures dans des tâches de catégorisation et de raisonnement. Les performances à ces tâches devraient également être inversement corrélées aux scores d’imagerie mentale (VVIQ etc).  
Deuxièmement, il sera question de mettre en relation leur fonctionnement cognitif avec des tâches nécessitant de l’imagerie mentale mais pas nécessairement échoué par les A. Dans quelle mesure performent-ils à une tâche cognitive écologique censée solliciter la création d’images mentales : la compréhension de texte ? Et dans quelle mesure, la performance à cette tâche sera reliée à la mise en place de stratégies différentes. Si c’est le cas, une bonne performance à ces tâches devrait être liée à un fonctionnement exécutif et intellectuel plus élevé. 

Pourquoi est-ce que les stratégies différentes seraient forcément associées à un fonctionnement exécutif et intellectuel plus élevé ? On pourrait faire l’hypothèse que les aphantasiques utilisent simplement d’autres modalités cognitives associées plastiquement à des tâches supposées requérir de l’imagerie uniquement visuelle.
Faire attention aux covariances : l’imagerie spatiale par ex. a été liée aux capacités en sciences, au raisonnement, à la réussite académique, etc.
Donc rien que sur ça, le domaine d’activité, le niveau d’études, le QI, etc. sont des facteurs confondants – à préciser

-->




\newpage
# Expérience

<!-- Méthode -->

## Méthode

### Participants

Nous recruterons des participants à partir de mi-février/début mars, lorsque l'expérience sera codée et prête à être diffusée en ligne. Pour estimer un ordre de grandeur du nombre de participants nécessaire pour obtenir des résultats intéressants, nous pouvons nous baser sur les calculs de puissance de @dawesCognitiveProfileMultisensory2020, qui ont mené une étude assez proche de la notre impliquant douze questionnaires et ayant pour objectif de mieux cerner le profil des aphantasiques. Ceux-ci ont estimé que pour une taille d'effet modérée des comparaisons, une puissance de 80% et avec un $\alpha$ très conservateur de 0.0002 (voir la section *\nameref{analyses}*), au moins 170 participants seraient nécessaires par groupe expérimental.   

Les participants devront avoir entre 18 et 50 ans et être locuteurs natifs français^[Il est à noter que dans l'étude de Dawes et al. [-@dawesCognitiveProfileMultisensory2020], 31 pays de résidence ont été répertoriés, avec 83% (*N* = 220) déclarant que l'anglais était leur première langue, et 88% (*N* = 235), s'identifiant comme blancs/caucasiens. Les résultats sont néanmoins cohérent avec le reste de la littérature sur l'aphantasie, avec aucun effet du langage. Cette étude interroge sur le potentiel intérêt de tenter de diffuser la présente étude à l'international.], avoir une vision normale ou corrigée et ne pas présenter de trouble de la lecture. Les participants aphantasiques seront recrutés en ligne sur des espaces spécifiques à leur condition (forums, groupes sur les réseaux sociaux, etc.). Nous nous intéressons à l'étude de l'aphantasie congénitale, les participants ne devront donc pas présenter d'antécédents de maladies neurologiques ou psychiatriques.      

Le critère répandu dans les études sur l'aphantasie pour identifier la condition est celui de l'auto-évaluation par le questionnaire VVIQ (Vividness of Visual Imagery Questionnaire, @marksVividnessVisualImagery1973), avec un score inférieur à 32 (voir la section *\nameref{questionnaires}*). Nous disposerons aussi de la composante objet de l'OSIQ (Object and Spatial Imagery Questionnaire, @blajenkovaObjectspatialImageryNew2006), fortement corrélée au VVIQ, fournissant donc des items supplémentaires - le seuil inférieur de ce questionnaire est évalué à 36, sur la base de deux écart-types à la moyenne de l'échantillon de @blajenkovaObjectspatialImageryNew2006. L'OSIQ, dans sa composante spatiale, sera par ailleurs utilisé pour l'auto-évaluation des capacités d'imagerie visuospatiales des participants, justifiant son utilisation en parallèle du VVIQ.   

En l'absence de données réelles de participants, nous avons donc préparé nos analyses prévisionnelles sur des données simulées sur R [@R-base]. Les paramètres de cette simulation (les résultats potentiels de chaque groupe) ont été basés sur la littérature et sur nos hypothèses : nous définirons donc le protocole dans un premier temps, puis reviendrons sur cette simulation dans la *section \ref{simulation}* dédiée.

### Questionnaires

Une faible capacité d'imagerie visuelle est généralement définie par un score total de 32 ou moins au questionnaire sur la vivacité de l'imagerie visuelle (VVIQ : voir Questionnaires sur l'imagerie dans les documents), une échelle d'auto-évaluation de Likert en cinq points qui varie de 16 à 80 (Marks, 1995 ; Zeman et al., 2015). Un score total de 32 équivaut à une note de 2 ("vague et faible") pour chaque item du questionnaire ; où 1 = "Pas d'image du tout, vous savez seulement que vous pensez à l'objet"). 

<!-- Sema
Le matériel était constitué de 6 épreuves neuropsychologiques, mesurant les capacités de raisonnement visuel et d'induction et de déduction de règles (version courte des matrices de Raven (Bilker et al., 2012), les capacités d'abstraction et de conceptualisation verbale (Subtest Similitudes de la WAIS-IV), la mémoire de travail verbale (Empan de chiffre envers), les fonctions exécutives (Test à préciser) et les capacités de compréhension en lecture (Texte, à décider). Cette dernière épreuve constituait une tache écologique dans laquelle les images mentales pouvaient être sollicitées. Enfin, une courte tâche de raisonnement était également proposée (Tâche de Wason, 1968). 
L'expérience comprenait aussi 2 questionnaires : le VVIQ, Questionnaire de Vivacité de l'Imagerie Visuelle (Marks, 1973), qui comporte 16 items et dans lequel le participant doit coter sur une échelle de Likert de 5 points l'énoncé qui lui correspond le mieux. Les scores vont de 16 à 80. Il constitue le questionnaire subjectif de référence dans l'aphantasie. Le second questionnaire était le MAI, Inventaire de Conscience Métacognitive (Schraw & Dennison, 1994), qui évalue les deux composantes de la métacognition : les connaissances métacognitives et la régulation métacognitive.


Dawes 2022 

VVIQ
The Vividness of Visual Imagery Questionnaire (VVIQ; Marks, 1995) is a 16-item scale which asks participants to imagine a person as well as several scenes and rate the vividness of these mental images using a 5-point scale ranging from 1 (“No image at all, you only “know” that you are thinking of the object”) to 5 (“Perfectly clear and <as> vivid as normal vision”). A single mean score on the VVIQ was computed for each participant. 

OSIQ
The Object and Spatial Imagery Questionnaire (OSIQ; Blajenkova, Kozhevnikov, & Motes, 2006) is a 30-item scale which requires participants to indicate how well each of several statements on object imagery ability (e.g. “When I imagine the face of a friend, I have a perfectly clear and bright image”) and spatial imagery ability (e.g. “I am a good Tetris player”) applies to them on a 5-point scale ranging from 1 (“Totally disagree”) to 5 (“Totally agree”). There are 15 items each comprising the Object and Spatial imagery domains of the OSIQ, averaged to form a mean score on each domain.
-->

### Tâches

Matrices de Raven

Test des Similitudes

Tâche de Wason

Digit Span

Lecture Comprehension

WCST

Blocs de Corsi

MRT

SRI

### Equipement

Sema :      
L’expérience a été développée à l’aide d’OpenSesame puis a été présentée en ligne sur un serveur JATOS (Lange et al, 2015).

<!-- 
Dawes 2022
Questionnaires were administered online using the Qualtrics research platform, and presented to each participant in random order. All participants completed a total of 206 questions in eight questionnaires. These questionnaires assessed self-reported multi-sensory imagery, episodic memory and future prospection, spatial abilities, mind-wandering and dreaming propensity, and response to stressful life events, as detailed below.


Palermo 2022
The protocol was performed online on the Qualtrics platform, and it included three sections: demographic and general health information, imagery assessment, and other cognitive skills assessment. Since we were interested in providing some preliminary information on the prevalence of aphantasia in the Italian context, we did not approach online groups of people with aphantasia as in some previous studies (e.g., Dawes et al., 2020), but we recruitedparticipants from the general community through advertisements on social media and university web pages. Data were collected from April 2020 to May 2021.
--> 

### Procédure expérimentale

Sema :      
Le participant effectuait les différentes épreuves neuropsychologiques. (Ordre des épreuves non décidé). Concernant la tâche de lecture, les participants étaient soumis à un texte qu'ils devaient lire. Le temps de lecture est libre mais chronométré. A la fin de la lecture, le texte est caché. Les participants devaient ensuite répondre à des questions sur le texte qui étaient d'ordres explicite ou implicite.
A la fin de la passation de l'ensemble des tests, le participant répondait au questionnaire sur la vivacité de l'imagerie visuelle (VVIQ) et au questionnaire de métacognition (MAI). Pour terminer l'expérience, un questionnaire démographique a été rempli.

## Variables et hypothèses

### Variables indépendantes

Sema :      
Groupe : aphantasiques et non-aphantasiques


### Variables dépendantes

Sema :      
Les VD sont les suivantes : 
-	Score aux Matrices
-	Score au test des Similitudes
-	Empan en MDT ou % de bonnes réponses ?
-	Score au texte de compréhension en lecture
-	Score à l'épreuve évaluant les fonctions exécutives
-	Pourcentage de réussite à la tâche de Wason pour chaque groupe
-	Score au VVIQ
-	Score au questionnaire MAI


### Hypothèses opérationnelles

Sema :     

1)	D'après les données présentées par l'étude de Zeman et al. (2020) (taux important d'aphantasiques dans les métiers scientifiques), on peut faire l'hypothèse que le groupe de participants aphantasiques présentera des capacités de raisonnement (mesurées par le test des Similitudes et les Matrices) plus développés que le groupe de participants non aphantasiques.

2)	Dans la mesure où les aphantasiques ont un défaut d'imagerie visuelle, si le texte de compréhension en lecture sollicite des images visuelles, on peut s'attendre à des performances différentes à ce texte entre les aphantasiques et les non aphantasiques.

3)	Conformément à l'hypothèse que les aphantasiques auraient recours à des stratégies pour compenser leur déficit en imagerie visuelle, des performances élevées en compréhension de texte pourraient être corrélées à des scores élevés aux épreuves mesurant le fonctionnement exécutif et les capacités d'abstraction.

Plan expérimental : S30<G2>

<!-- 
Dawes 2022
Object Imagery
We expected aphantasic individuals to report reduced visual imagery ability compared to controls, in line with previous findings (Keogh & Pearson, 2018; Zeman et al., 2015). There is some suggestion that auditory imagery may also be reduced in individuals who report visual imagery absence, however this evidence comes from case studies with limited sample sizes (Greenberg & Knowlton, 2014). We therefore had no strong hypotheses regarding group differences in other multi-sensory imagery domains.
Spatial Imagery
Lastly, we expected aphantasic self-reports of spatial imagery and spatial navigation abilities to align with data from previous studies suggesting that despite visual imagery absence, spatial abilities (as measured by questionnaires and performance on mental rotation and visuo-spatial tasks) appear to be largely preserved in aphantasia (Keogh & Pearson, 2018; Zeman et al., 2010).
-->

## Simulation

En suivant les recommandations des analyses de puissance, nous avons décidé de simuler *N* = 200 participants pour chaque groupe, aphantasiques et non-aphantasiques. 

<!-- 
VVIQ
M dawes = 17.94 vs 58.12
M Chacha = 21.23, sd 5.48 16 à 31.5
M NA Chacha = 56.33 sd 9.87 34.5 à 78.5
OSIQ
OSIQ object total score < 36);
OSIQ spatial total score < 25);
(see Imagery Results section)

### Note : Nous avons choisi une moyenne plus conservatrice dans notre simulation pour le VVIQ des aphantasiques, à M = 30.2, et à 63.8 dans le groupe contrôle. L'écart entre les deux est donc plus ou moins équivalent, à 40 chez Dawes et 33 dans notre simulation.
-->

## Analyses

Sema :      
L'analyse des résultats sera effectuée avec le logiciel JASP (Love et al., 2019). Des t-students et des ANOVAs seront menés en premier lieu afin d'observer s'il existe des différences dans les VD entre les aphantasiques et les non-aphantasiques. Des analyses corrélationnelles (Bravais-Pearson) seront ensuite effectuées sur les différentes mesures, ainsi que des régressions. Les données seront ensuite soumises à des analyses par clusters.

<!--
Dawes 2022

Data for aphantasic subjects demonstrated significant positive skew (see Figure 2.1). Non-parametric Mann-Whitney U hypothesis tests were therefore conducted in SPSS 25.0 for Mac OS, using Bonferroni adjusted alpha levels of a= 0.0002 (0.05/206 where 206 is the total number of question items across all questionnaires) to correct for multiple comparisons. Estimates of effect sizes r were computed using the following formula: r= ! √	$ where Z is the Mann-Whitney standardized test statistic, N the total sample size of the combined groups, and r the output effect size estimate (comparable with Cohen’s d effect size interpretations; Rosenthal, 1994). Because we adopted a highly conservative adjusted alpha, Mann-Whitney tests were supplemented by Bayesian analyses conducted in JASP. For all Bayesian analyses, a Cauchy prior of .707 was used. Bayes factors were used to help compare the weight of evidence for between-group differences across test comparisons, whilst Mann-Whitney tests were used to make overall inferences about test direction and significance. Bayes factors were interpreted according to common threshold guidelines (Jeffreys, 1961), where 1 = “No evidence”, 1-3 = “Anecdotal evidence, 3-10 = “Moderate evidence”, 10-30 = “Strong evidence”, 30-100 = “Very strong evidence”, and >100 = “Extreme evidence”.

Palermo 2022

Due to the non-normal distribution of the demographic, mental imagery, and other skills measures, as verified with the ShapiroWilk test (see Table S1 in Supplementary material), non-parametric analyses (i.e., Kruskal–Wallis tests) were performed to evaluate possible differences among the groups.
we performed group comparisons only on five groups: Controls, OAph, SAph, OHyper, and SHyper; thus, these two participants were not included in the group analyses. A Bonferroni adjusted alpha level of 0.005 was applied (0.05/11). Significant group effects were further analyzed with planned post hoc comparisons using Mann–Whitney U tests and applying a Bonferroni correction for multiple comparisons (0.05/6 = 0.008). In particular, the following planned post-hoc comparisons were performed: OAph vs. SAph, OAph vs. Controls, SAph vs. Controls, OHyper vs. SHyper, OHyper vs. Controls, SHyper vs. Controls.


Data transformation

Dawes 2022

All analyses were conducted on raw data. Data visualisation for Figure 2.1 only, however, was carried out on median-centered raw questionnaire data using the following transformation:
y = (x - (Smin + (Smac -Smin)/2))/(Smax-Smin)
where y is the transformed score, x the raw individual item score for scale S, and S.min and S.max the lowest and highest possible scores on that scale, respectively. This transformation allows us to graphically compare results across scales, with a value of -0.5 representing the lowest possible score, 0 the median score, and 0.5 the maximum possible score on each scale.


Cluster Analysis

Lefèvre 2022

Analyse de partition non-supervisée
L’objectif de cette partie est de proposer une identification de profils combinant les trois compétences du langage écrit grâce à un algorithme de partition non-supervisée (unsupervised clustering) provenant des techniques de l'apprentissage machine. 
Les techniques de partition non-supervisée permettent une identification de profils sans hypothèse a priori et en particulier sans prendre en compte le diagnostic de la personne. 
L’algorithme des k-means a été choisi parmi l’ensemble des méthodes existantes car il montre de bonnes performances dans le domaine des études trans-diagnostiques (Bradshaw et al., 2020; Dalmaijer et al., 2021; Willems et al., 2016) et les résultats sont simples d’interprétation. 
L’algorithme des k-means repose sur le calcul d’une matrice de dissimilarité contenant les mesures de distance euclidienne. Une distance euclidienne est une mesure permettant de quantifier la distance entre deux observations (ici deux personnes). Plus la distance euclidienne est importante et plus la distance entre les observations est importante.
Le calcul de la distance euclidienne entre deux observations repose sur le théorème de Pythagore tel que représenté dans la Figure 1.2. Alors qu’il est aisé de comprendre et de représenter graphiquement le calcul d’une distance euclidienne dans un espace bi-dimensionnel, avec l’ajout d’une troisième dimension le théorème de Pythagore ne suffit plus pour calculer la distance euclidienne et par conséquent la formule suivante est utilisée :
$$
D_{i,j}^2 = \sum_{v=1}^{n}(x_{vi}-x_{vj})^2
$$
La distance entre l’observation i et l’observation j (Dij) est calculée dans un espace de dimension n et est égale à la somme des carrés des distances entre les deux scores dans chacune des dimensions. Une fois appliquée, cette formule permet d’avoir une mesure de distance, aussi appelé dissimilarité, pour chaque paire d’observations. La mesure de distance peut ensuite être utilisée dans un algorithme des k-means qui permet de regrouper les observations en k sous-groupes (k étant le nombre de sous-groupes/clusters). Le nombre de clusters peut être décidé grâce à plusieurs indices informatifs (Charrad et al., 2014). Les étapes de l’algorithme des k-means sont présentées dans l’Encart 2.
Une des limites de l’algorithme des k-means repose sur la première étape. Durant l’étape d’initialisation, des observations sont choisies au hasard pour servir de centres des clusters. Ce type d’initialisation a une tendance à biaiser l’attribution des observations au sein des clusters. Pour pallier ce biais, il est possible de conduire l’algorithme de multiples fois et d’observer les résultats d’assignation de chaque observation comme une probabilité (Fränti & Sieranoja, 2019). Par exemple, dans un k-means à deux clusters conduits 1000 fois, l’observation A peut-être assignée 200 fois au cluster 1 et 800 fois au cluster 2. Dans ce cas, l’observation A peut être attribuée au cluster 2, représentant 80% des assignations. 

--> 

\newpage
<!-- Résultats -->

## Résultats

### Différences de moyenne des deux groupes

<!-- Dawes 2022

Violin plot vertical avec toutes les mesures (ils en ont 12 ! Comme nous)
-> le nom de la mesure
-> la capacité cognitive qu'elle évalue, comme une barre traversant plusieurs mesures
-> la légende avec les deux groupes au dessus

Spatial Ability Results. 
Aphantasic participants reported slightly lower spatial imagery ability on the spatial sub-component of the OSIQ when compared to control group 1 (Mann-Whitney U = 24,462, p = 0.001, r = .15, BF10 = 14.65, two-sided; see Figure 2.1 purple section), although this effect was not significant after Bonferroni correction. Additionally, the scores of aphantasic individuals on the Spatial Memory component of the SAM (which includes items measuring reported spatial navigation and naturalistic spatial memory ability) were not significantly different from controls (SAM; Mann-Whitney U = 24,720, p = 0.1, r = .08, BF10 = .23, two-sided; see Figure 2.1 purple section). These results demonstrate that overall, there were no consistent differences in reported spatial abilities between aphantasic individuals and participants in control group 1.


Lefèvre 2022

Ptet aussi faire un tableau simple pour les moyennes générales


--> 


### Corrélations entre les variables mesurées
```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Matrice de corrélation entre les variables mesurées.}
\label{correlation_matrix}
\end{figure}
```

<!--
```{=latex}
\begin{figure}[H]
```

\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/mixed_matrix-1} \end{center}
```{=latex}
\caption{Matrice présentant les distributions des variables, l'analyse de leurs corrélations et les représentations associées.}
\label{mixed_matrix}
\end{figure}
```
-->

### Analyses des groupes par partition non-supervisée

<!-- Lefèvre 2022

La création de ces profils dans notre échantillon repose sur les trois compétences du langage écrit : fluence et compréhension en lecture et orthographe. Nous avons calculé une matrice de dissimilarité puis le nombre de clusters a été calculé grâce à l’ensemble des indices présents dans le package R NbClus (Charrad et al., 2014).
La majorité des indices propose un nombre optimal de quatre clusters pour notre échantillon. Une implémentation multiple (n = 1000) de l’algorithme des k-means a été conduite avec 4 clusters sur l’ensemble de l’échantillon.
-->

```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Graphique représentatant l'évalution du nombre idéal de clusters par la méthode 'Within Sum of Squares'.}
\label{cluster_number}
\end{figure}
```

```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Représentation de l'analyse en composantes principales des variables mesurées.}
\label{pca_variables}
\end{figure}
```

<!--
Les observations étaient ensuite attribuées au cluster le plus probable en termes d’assignation.
Le résultat des k-means est représenté dans la Figure 1.3 (avec les profils cognitifs sur les trois compétences -> pas nous).
-->

```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Représentation des clusters reconnus par la méthode des 'k-means', selon les deux composantes principales de l'ACP.}
\label{k_means}
\end{figure}
```

### Analyse des clusters

<!-- Les profils ont ensuite été étudiés sur leur composition en fonction du diagnostic initial et sur les compétences cognitives du profil et celles sous-tendant ces performances grâce à des comparaisons de groupes.-->
```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Diagramme représentatant les profils cognitifs associés à chaque cluster, selon quatre dimensions principales : l'imagerie visuelle-objet, l'imagerie visuo-spatiale, le raisonnement et les fonctions exécutives.}
\label{profiles_radar}
\end{figure}
```

```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Représentation alternative des profils cognitifs associés aux clusters.}
\label{profiles_lollipop}
\end{figure}
```

### Différences entre les groupes identifiés
```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Répartion des groupes par cluster.}
\label{cluster_repatition}
\end{figure}
```

<!--
Dans le but d’interpréter les clusters à partir des scores des compétences les composant, une moyenne en dessous de 0 (moyenne standardisée) était considérée comme déficitaire et une moyenne au-dessus de 0 comme non-déficitaire. Les moyennes et écart-types avec les tailles d’effectif sont présentés dans le Tableau 1.2. Dans l’objectif de mieux décrire les sousgroupes, nous avons réalisé des analyses de variance univariées. Les trois comparaisons étant significatives, nous présentons les résultats des tests post-hocs (avec correction de Bonferroni) qui sont représentés sur les histogrammes de la Figure 1.4.

Moyennes, écart-types et effectifs par clusters.
Note : Les moyennes en gras correspondent à des moyennes supérieures à 0.
Voir la figure d'Elise : les clusters sont en ligne, les fonctions cognitives en colonnes, deux colonnes avec la proportion d'Aph NAph et le total des clusters. Le notre aura en théorie juste une colonne en plus
Je sais pas si elle a fait le tableau manuellement sur Rmd ou Latex ou R, mais le résultat est joli.
-->

```{=latex}
\begin{figure}[H]
```

```{=latex}
\caption{Comparaison des moyennes de score d'imagerie visuelle-objet entre les quatre groupes identifiés.}
\label{object_img_violins}
\end{figure}
```

<!--
```{=latex}
\begin{figure}[H]
```

```
## [1] FALSE
```



\begin{center}\includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/spatial_img_violins-1} \end{center}
```{=latex}
\caption{Comparaison des moyennes de score d'imagerie visuospatiale entre les quatre groupes identifiés.}
\label{spatial_img_violins}
\end{figure}
```
-->


\newpage
<!-- Discussion -->

# Discussion

\newpage
# Références {-}

<div id="refs"></div>

\newpage
# Annexes {-}

Le code complet de ce manuscrit, de la simulation, des figures, tables et analyses est accessible dans [*ce repository*, sur GitHub](https://github.com/m-delem/aphantasia_project.git).

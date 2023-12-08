# Planète Super Sympa - Nuit de l'Info 2023
## Introduction
Ce compte-rendu présente notre projet réalisé dans le cadre de la Nuit de l'Info, axé sur le thème du changement climatique. Notre objectif a été de développer une application qui non seulement adhère au thème mais promeut également les principes du développement durable dans tous ses aspects et tout particulièrement l'éco conception.

Vous pouvez retrouver notre projet sur https://ndl.super-sympa.fr

Nous nous sommes largement inspiré du [guide eco-conception numérique](https://eco-conception.designersethiques.org/guide/fr/) pour nous guider dans cette aventure.

## Choix de l'Hébergement
Pour l'hébergement de notre application, nous avons choisi **Kimsufi**, un service qui se distingue par sa démarche écoresponsable dans la gestion des serveurs. Kimsufi adopte une approche innovante et durable en réutilisant des serveurs plus anciens qui, bien que n'étant plus les plus récents sur le marché, restent performants et parfaitement adaptés à de nombreuses applications web.

Au lieu de mettre ces serveurs directement à la poubelle, ce qui contribuerait à l'accumulation de déchets électroniques et à une augmentation de la demande en nouvelles ressources matérielles, Kimsufi les remet en circulation. Cette pratique permet non seulement de réduire l'impact environnemental lié à la production et à l'élimination de matériel informatique, mais offre également une solution d'hébergement à moindre coût.

## La Simplicité, Clé de l'Efficacité
Notre site a été intentionnellement conçu comme une application web statique, délaissant l'usage d'APIs et de bases de données non indispensables. Couramment, on imagine que pour diffuser notre contenu, il serait nécessaire d'avoir une base de données pour stocker les informations textuelles, et une API pour servir d'interface entre le serveur et l'utilisateur.

Cependant, cette perception n'est pas toujours justifiée. De nombreuses applications, en particulier celles destinées à afficher un contenu relativement statique ou peu complexe, n'ont pas besoin de telles structures. En reconnaissant cela, nous avons choisi de limiter nos infrastructures à l'essentiel.

En optant pour une application statique, nous réduisons la charge serveur et les besoins en maintenance. Cette approche allège non seulement notre empreinte carbone mais optimise également les performances et la fiabilité de notre site. De plus, cette simplicité structurelle permet une expérience utilisateur rapide et fluide, puisque le contenu est directement délivré sans traitement intermédiaire.


## Optimisation des Ressources avec [Kubernetes](https://kubernetes.io/fr/)
Pour une gestion optimale des ressources serveur, nous avons intégré Kubernetes dans notre infrastructure. Cette technologie clé nous offre la flexibilité de redimensionner les ressources de manière automatique en fonction de la demande actuelle. Ainsi, nous évitons l'utilisation excessive d'énergie et la consommation superflue de capacités de calcul.

Dans un scénario où notre site n'attirerait pas de visiteurs ;(, il resterait économe en ressources, ce qui est crucial pour une gestion durable. En revanche, lors d'un pic de trafic, comme lors de l'annonce de notre victoire par l'équipe de la Nuit de l'Info, notre application web recevra automatiquement plus de ressources (mémoire, CPU, etc.) pour gérer efficacement l'augmentation de la charge.

Cette approche nous permet de n'utiliser des ressources supplémentaires que lorsque cela est réellement nécessaire, évitant ainsi le gaspillage et alignant notre projet sur les principes du développement durable.

Pour en savoir plus sur notre implémentation : [notre déploiement kubernetes](https://github.com/EQUIPE-SUPER-SYMPA-Nuit-de-l-info/FrontNDL/tree/main/k8s)


## Gestion des Images et des Fichiers
Les images utilisées sont compressées pour minimiser le poids des données transférées. Cette réduction a un impact direct sur la quantité de données stockées et transférées, diminuant ainsi l'empreinte carbone associée à l'utilisation de l'application.


## Conclusion
Notre projet pour la Nuit de l'Info s'inscrit dans une démarche globale de développement durable. Chaque choix, de l'hébergement à la conception du site, a été guidé par le souci de minimiser l'impact environnemental. 

L'équipe Super Sympa© vous remercie et vous souhaite une vie super sympa :)

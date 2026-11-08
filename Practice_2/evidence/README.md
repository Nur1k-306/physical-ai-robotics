# Данные для проверки экспериментов

- [runs.csv](runs.csv) содержит финальный скаляр обучения, длительность из `training.log`, число успехов и захватов из `inference.log`, относительные пути и SHA-256 моделей и видео. Пути отсчитываются от корня репозитория. Модели и видео передаются отдельно.
- [inference_episodes.csv](inference_episodes.csv) содержит 10 эпизодов каждого прогона. Поля `grasp` и `success` принимают 0 или 1. Расстояние и награда приведены с точностью текстового журнала. Флаг успеха взят из журнала и учитывает расстояние до округления.
- Снимки конфигурации PPO сохранены в каталогах [baseline](baseline/config.json), [max_iters_500](max_iters_500/config.json), [box_target_strong](box_target_strong/config.json), [qpos_strong](qpos_strong/config.json) и [learning_rate_3e4](learning_rate_3e4/config.json).
- Для [box_target_strong](box_target_strong/reward_config.json) и [qpos_strong](qpos_strong/reward_config.json) сохранены веса награды и оригинальные сводки `results.json`. Для [learning_rate_3e4](learning_rate_3e4/reward_config.json) сохранены веса награды, [сводка кривых](learning_rate_3e4/curve_statistics.json) и [998 точек на прогон](learning_rate_3e4/mean_reward_comparison.csv), по которым построен график.

Точные финальные скаляры в `runs.csv` взяты из сохранённых наблюдений и сверены с округлённым выводом обучения. Для прогонов с изменёнными весами и скоростью обучения их также подтверждают сводки в этом каталоге.

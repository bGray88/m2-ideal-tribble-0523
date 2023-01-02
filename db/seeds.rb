
studio_1 = FactoryBot.create(:studio)
studio_2 = FactoryBot.create(:studio)
studio_3 = FactoryBot.create(:studio)
studio_4 = FactoryBot.create(:studio)
studio_5 = FactoryBot.create(:studio)

actor_1 = FactoryBot.create(:actor)
actor_2 = FactoryBot.create(:actor)
actor_3 = FactoryBot.create(:actor)
actor_4 = FactoryBot.create(:actor)
actor_5 = FactoryBot.create(:actor)

movie_1 = FactoryBot.create(:movie, studio: studio_1)
movie_2 = FactoryBot.create(:movie, studio: studio_3)
movie_3 = FactoryBot.create(:movie, studio: studio_2)
movie_4 = FactoryBot.create(:movie, studio: studio_5)
movie_5 = FactoryBot.create(:movie, studio: studio_5)

actor_1.movies << movie_1
actor_1.movies << movie_2
actor_1.movies << movie_3
actor_1.movies << movie_4
actor_2.movies << movie_2
actor_2.movies << movie_4
actor_2.movies << movie_5
actor_3.movies << movie_3
actor_5.movies << movie_4
actor_4.movies << movie_1

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Session.destroy_all
Activity.destroy_all
# User.destroy_all
Category.destroy_all

bio_array = [
            " BS in Physical Education as well as a MS in Exercise Science and Health Promotion. He is a Certified Strength and Conditioning Specialist (CSCS). He has a background in health and fitness as well as athletic performance training with over 20 years of certification and experience in the field. His passion for fitness began through his love of sports and developed as a varsity athlete in basketball.",
            " Undergraduate student at Georgetown University. She became a National Academy of Sports Medicine (NASM) Certified Personal Trainer in 2019, and is currently working toward a specialization in corrective exercise. A lifelong dancer, Ashley believes wholeheartedly that movement is a necessary component of physical and mental wellness and personal expression.",
            " Certified Strength and Condition Specialist (CSCS) with the National Strength and Conditioning Association. He has an extensive background from training professional and amateur athletes to working professionals with nominal experience in fitness. Christopher approaches fitness as a life long behavior modification where we have continuous improvement. He defines his sessions as simple, challenging, and efficient with an emphasis on proper form and mobility.",
            " ACE Certified Personal Trainer since 2017 and previously worked as a Personal Trainer at the University of Maryland. He is currently pursuing a Master’s of Science in Analytics at GU, and hopes to use that knowledge to spread and improve health and wellness! Doug found his passion for fitness throughout middle and high school. He played sports his entire life, but was overweight and could not balance his nutrition and exercise in a healthy and effective way.",
            " Orthopedic & Sports Medicine Physical Therapy for 27 years and as a Personal Trainer for 15 years. B.A. in Kinesiology and is a National Strength and Conditioning Association (NSCA) Certified Personal Trainer and National Academy of Sports Medicine (NASM) Certified Corrective Exercise Specialist. Her passion for exercise began during her first experience with Tae Bo at a young age",
            " BS in Biology/Pre-Medical Sciences and a MS in Public Health with a concentration in Nutrition. She is an ACE Certified Personal Trainer and Group Fitness Instructor. She also holds a specialty certification as a Fitness Nutrition Specialist, Spinning Instructor, and TRX Instructor. Maegen has an extensive background in strength, conditioning, speed, endurance, and agility training as she was a former collegiate athlete."
            ]


#users
10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              trainer: [true, false].sample,
              bio: User.create!(bio: bio_array.sample),
              zoom_link: "zoom.us 19xLS"
              )
end


#categories
category_array = ["Strength Training", "Gymnastics", "Endurance", "Body Hit", "Spin", "Shadow Boxing", "Yoga", "Pilates", "Bands", "Core Workout"]

5.times do
  category = Category.create!(name: category_array.sample)
end


activity_name_array = ["Get In Shape", "Yoga Basics", "Triple Tone", "Full Body Circuit", "Yoga Intense", "Full-Body Starter", "Pure Pilates", "Intense Shadow Boxing"]

description_array = [
                    " Grab your weapons. Whether you wage war with ropes, sandbells or kettlebells, this is a workout for true warriors. We’re talking peak power, epic endurance and hardcore HIIT for aspiring athletes, fitness fanatics and first-timers alike. Get practicing your battle cry. It’s about to go down.",
                    " If you thought the name was inspired by the killer abs you’re going to get from this class, we’ve got bad news. Try the killer workout you crunch, twist and plank through to get there. This is one mad assault on your middle that definitely earns that 6 pack. (And the one in the fridge.)",
                    " For full-body fitness, row is all you need to know. Dive in the deep end with a hardcore workout that tightens up your technique, perfects pacing and helps you unlock your body’s natural biomechanical speed. Sure, we like to get a bit sciencey. But with expert instructors to guide you, you won’t be without a paddle.",
                    " Whether you’re a slave to the rhythm or addicted to bass, this catchy little conditioning class is guaranteed to get peak fitness pouring from every pore. This is bodyweight endurance to a beat, challenging your strength, sculpting your figure and making music pulse through every muscle. The floor is yours.",
                    " Swap your same-old cardio routine for a group session that'll really test your stamina. Working you hard from top to toe, this kettlebell swing circuit builds power and shreds fat while the energy in the studio reaches boiling point. Hold tight because things are about to get seriously steamy.",
                    " Discover what it means to be a true triple threat at Trilactic. Taking over the Escalate studio, you’ll move through three stations as part of a trio – tackling lung-busting, lactic system-enhancing challenges that improve strength, cardio and agility. Well they say good things come in threes…",
                    " We have teamed up with Track Mafia to bring you weekly outdoor running sessions, whether you are a beginner or seasoned vet their aim is to give you the tools you need to smile in the face of discomfort. All abilities welcome.",
                    " When it comes to lifting, we don’t all like it heavy and slow. If it’s plenty of pumping and a cranked up tempo that gets you going, these low-weight loads provide all the sweaty, sculpting, rep-fuelled rough n' tumble you need. It’s impossible to not look in the mirror and feel yourself after this.",
                    " For full-body fitness, row is all you need to know. Dive in the deep end with a hardcore workout that tightens up your technique, perfects pacing and helps you unlock your body’s natural biomechanical speed. Sure, we like to get a bit sciencey. But with expert instructors to guide you, you won’t be without a paddle.",
                    " Build the strength to smash life, without the incredible bulk. This is all about control: precise movements that stretch and tone to improve your posture, increase your flexibility and reinforce your core. You know what they say. Hit the mat and you’ll never go back."
                    ]

#activities
20.times do
  activity = Activity.new(name: activity_name_array.sample,
              user_id: User.where(trainer: true).pluck(:id).sample,
              description: Activity.create!(description: description_array.sample)
              category_id: Category.pluck(:id).sample)
  activity.save!
end



#sessions
10.times do
  starttime = (((DateTime.now - 10.days)..(DateTime.now + 10.days)).to_a.sample + rand(24).hours).change(min:0)
  Session.create!(min_participants: rand(1..5), max_participants: rand(8..10), start_time: starttime,
  end_time: starttime + 1.hour,
    price: rand(5..20), activity_id: Activity.pluck(:id).sample, confirmed: false)
end









#bookings
30.times do
  Booking.create!(user_id: User.pluck(:id).sample,
  session_id: Session.pluck(:id).sample,
  attended: true )
end






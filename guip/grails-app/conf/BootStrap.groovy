class BootStrap {

     def init = { servletContext ->
         def taylorHome = new Address(
             street:'123 Lincoln Way', 
             city:'St. Louis', 
             state:'MO', 
             country: 'US',
             zip:'63337'
         ).save()
         new Person(
             firstName:'Matt', lastName:'Taylor',
             birthDate: [78,6,11] as Date,
             address: taylorHome
         ).save()
         new Person(
             firstName:'Trinity', lastName:'Taylor',
             birthDate: [79, 3, 16] as Date,
             address: taylorHome
         ).save()
         new Person(
             firstName:'Jeff', lastName:'Brown',
             birthDate: [70] as Date,
             address: new Address(
                 street:'68 Ricochet Lane',
                 city:'St. Charles', state:'MO', country:'US', zip:'62478'
             ).save()
         ).save()
     }
     def destroy = {
     }
} 
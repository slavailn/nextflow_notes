// First script in nextflow: Hello World!

// Create process
process sayHello {

// Specify bash command between triple quotes
"""
echo 'Hello world!' 

"""

}

// Create workflow
workflow {

    sayHello()

}

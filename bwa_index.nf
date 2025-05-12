// Specify parameters
params.ref="/path/to/pipedev/ref/M_ulcerans.fa" // path to genome fasta
params.index_dir="/path/to/pipedev/ref" // path to directory where index files will be saved

// Create process
process bwaIndex {
    // Specify directory to save output, mode copy means that output
    // files will be copied from the default directory, not moved.
    // We can specify mode: 'move'
    publishDir("${params.index_dir}", mode: 'copy')

    // Specify inputs, "genome" variable can have any name
    input:
     path genome

    // Specify output and glob all files by using "*"
    output:
     path "*"

    // Command to run, note we are handing it a variable from input
    script:
    """
        bwa index $genome
    
    """
}


// specify workflow
workflow {

    // provide channel to the file used by the command we need to run
    ref_ch=Channel.fromPath(params.ref)
    // Execute process, provide channel as an argument
    // We can provide more arguments separated by commas
    bwaIndex(ref_ch)
    // Print output files to std out
    bwaIndex.out.view()
}

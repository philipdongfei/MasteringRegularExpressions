use clap::{App, Arg};
use regex::{Regex, RegexBuilder};
//use fancy_regex::Regex;
//use lazy_regex::{Regex, RegexBuilder};
use std::{
    error::Error,
    fs::{self, File},
    io::{self, BufRead, BufReader},
    ops::Deref,
};

type MyResult<T> = Result<T, Box<dyn Error>>;

#[derive(Debug)]
pub struct Config {
    files: Vec<String>,
}

pub fn get_args() -> MyResult<Config> {
    let matches = App::new("find_dbl")
        .version("0.1.0")
        .author("Philip Tung <philip.tungfei@gmail.com>")
        .about("Rust find double words")
        .arg(
            Arg::with_name("files")
                .value_name("FILE")
                .help("Input file(s)")
                .multiple(true)
                .default_value("-"),
        )
        .get_matches();

    let files = matches.values_of_lossy("files").unwrap();
    Ok(Config {
        files,
    })
}

fn find_files(paths: &[String]) -> Vec<MyResult<String>> {
    let mut results = vec![];

    for path in paths {
        match path.as_str() {
            "-" => results.push(Ok(path.to_string())),
            _ => match fs::metadata(path) {
                Ok(metadata) => {
                    if metadata.is_dir() {
                        results.push(Err(From::from(format!(
                            "{} is a directory",
                            path
                        ))));
                    } else if metadata.is_file() {
                        results.push(Ok(path.to_string()));
                    }
                }
                Err(e) => {
                    results.push(Err(From::from(format!("{}: {}", path, e))))
                }
            },
        }

    }
    results
}


fn get_para<T: BufRead>(
    file: &mut T
    //filename: &str
) -> MyResult<String> {
    let mut line = String::new();
    let mut para = String::new();

    // get para
    loop {
        let bytes = file.read_line(&mut line)?;
        if bytes == 0 {
            break;
        }
        if para.len() == 0 || line.len() != 0 {
            line = line + "\n";
            para.push_str(&line);
        }
        line.clear();
    }
    Ok(para.to_string())
    /*
    let pattern1 = r"\b([a-z]+)((?:\s|<[^>]+>)+)($1\b)".to_string();
    //let pattern1 = "\\b([a-z]+)((?:\\s|<[^>]+\\>)+)($1\\b)".to_string();
    let regex1 = RegexBuilder::new(&pattern1)
        .case_insensitive(true)
        .build()
        .unwrap();
        //.map_err(|_| format!("Invalid pattern \"{}\"", &pattern1))?;
    //let replace1 = "\033[7m$1\033[m$2\033[7m$3\033[m".to_string();
    //let pattern2 = "^(?:[^[[:space:]]]*\\n)+".to_string();
    let replace1 = r"\e[7m$1\e[m$2\e[7m$3\e[m".to_string();
    let pattern2 = r"^(?:[^[[:space:]]]*\n)+".to_string();
    let regex2 = RegexBuilder::new(&pattern2)
        .multi_line(true)
        .build()
        .unwrap();
        //.map_err(|_| format!("Invalid pattern \"{}\"", &pattern2))?;
    let pattern3 = r"^([^\n]+)".to_string(); 
    //let pattern3 = "^([^\\n]+)".to_string(); 
    let regex3 = RegexBuilder::new(&pattern3)
        .multi_line(true)
        .build()
        .unwrap();
        //.map_err(|_| format!("Invalid pattern \"{}\"", &pattern3))?;
    let r1 = regex1.replace_all(&para, replace1); 
    println!("para: {}", para);
    let r2 = regex2.replace_all(&r1, "");
    println!("r1: {}", r1);
    let replace3 = format!("{}: $1", filename);
    let results = regex3.replace_all(&r2, replace3);
    println!("r2: {}", r2);
    Ok(results.to_string())
    */
}

fn open(filename: &str) -> MyResult<Box<dyn BufRead>> {
    match filename {
        "-" => Ok(Box::new(BufReader::new(io::stdin()))),
        _ => Ok(Box::new(BufReader::new(File::open(filename)?))),
    }
}


pub fn run(config: Config) -> MyResult<()> {
    let entries = find_files(&config.files);

    for entry in entries {
        match entry {
            Err(e) => eprintln!("{}", e),
            Ok(filename) => match open(&filename) {
                Err(e) => eprintln!("{}: {}", filename, e),
                Ok(mut file) => {
                    loop {
                        let txt = get_para(&mut file);
                        match txt {
                            Err(e) => eprintln!("{}", e),
                            Ok(para) => {
                                if para.is_empty(){
                                    break;
                                }
                                // don't success
                                //let pattern1 = r"X(.+)+X".to_string();//r"(?m)nfa|nfa not".to_string();
                                //let pattern1 = r#""[^"]*""#.to_string();
                                let pattern1 = r#"<B>((?!<B>).)*?</B>"#.to_string();
                                //let pattern1 = "(?iu)\\b([a-z]+)((?:\\s|<[^>]+>)+)(\\1\\b)".to_string();
                                println!("pattern1: {}", &pattern1);
                                let regex1 = Regex::new(&pattern1).unwrap();
                                /*
                                let regex1 = RegexBuilder::new(&pattern1)
                                    .case_insensitive(true)
                                    .build()
                                    .unwrap();
                                */
                                if regex1.is_match(&para) {
                                    println!("match: {}", &para);
                                    let caps = regex1.captures(&para).unwrap();
                                    caps.iter().enumerate().for_each(|(i,c)| {
                                        println!("Item {} = {:?}", i, c);
                                    })
                                } else {
                                    println!("no match: {}", &para);
                                }

                            }
                        }
                    }
                }
            },
        }
    }

    Ok(())
}
